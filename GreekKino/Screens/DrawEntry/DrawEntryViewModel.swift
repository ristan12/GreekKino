//
//  DrawEntryViewModel.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import Foundation

class DrawEntryViewModel: ObservableObject {
	private static let quotaDictionary: [Int: Double] = [
		1: 3.6,
		2: 15.0,
		3: 60.0,
		4: 250.0,
		5: 1000.0,
		6: 3800.0,
		7: 12500.0,
		8: 35000.0,
	]

	@Published private(set) var pickedNumbers: Set<Int> = [] {
		didSet {
			updateQuota()
			submitDisabled = pickedNumbers.isEmpty
		}
	}
	@Published private(set) var currentQuota: Double = 1.0
	@Published private(set) var submitDisabled: Bool = true
	@Published var ticketCreatedAlert: Bool = false
	@Published var ticketCreateFailedAlert: Bool = false

	private(set) var draw: KinoDraw

	init(draw: KinoDraw) {
		self.draw = draw
	}

	func didPickNumber(_ number: Int) {
		if pickedNumbers.contains(number) {
			pickedNumbers.remove(number)
		} else {
			if pickedNumbers.count == 8 { return }
			pickedNumbers.insert(number)
		}
	}

	func isNumberPicked(_ number: Int) -> Bool {
		return pickedNumbers.contains(number)
	}

	func submitTicket() {
		// TODO: Call API to submit ticket and handle errors
		// Right now, we just check to see if time ran out
		if Date.now < Date(timeIntervalSince1970: draw.drawTime / 1000) &&
			TicketManager.shared.saveTicket(Ticket(id: UUID(), 
												   drawId: "\(draw.id)",
												   numbers: Array(pickedNumbers),
												   quote: currentQuota)) {
			ticketCreatedAlert = true
			ticketCreateFailedAlert = false
		} else {
			ticketCreatedAlert = false
			ticketCreateFailedAlert = true
		}
	}

	func reset() {
		pickedNumbers.removeAll()
	}

	private func updateQuota() {
		currentQuota = DrawEntryViewModel.quotaDictionary[pickedNumbers.count] ?? 1.0
	}
}

