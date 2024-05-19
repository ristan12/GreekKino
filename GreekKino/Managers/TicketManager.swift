//
//  TicketManager.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import Foundation

class TicketManager {
	private init() { readAllTickets() }
	static let shared: TicketManager = TicketManager()

	@Published private(set) var tickets: [Ticket] = []

	func checkAllTickets() {
		for ticket in tickets {
			if ticket.state == .pending {
				KinoAPIManager.shared.getDrawData(drawId: ticket.drawId) { result in
					switch result {
					case .success(let drawData):
						if drawData.status == "results" {
							self.updateTicketState(ticket.id.uuidString, winningNumbers: Set(drawData.winningNumbers?.list ?? []))
						}
					case .failure:
						print("failed fetching draw data")
					}
				}
			}
		}
	}

	func updateTicketState(_ ticketId: String, winningNumbers: Set<Int>) {
		do {
			let path = FileManager.documentsFolderUrl().appendingPathComponent(ticketId).path()
			if let data = FileManager.default.contents(atPath: path) {
				let ticket = try JSONDecoder().decode(Ticket.self, from: data)
				let updatedTicket = Ticket(id: ticket.id,
										   drawId: ticket.drawId,
										   numbers: ticket.numbers,
										   quote: ticket.quote,
										   state: Set(ticket.numbers).intersection(winningNumbers).count == ticket.numbers.count ? .winning : .loosing,
										   timestamp: ticket.timestamp)
				_ = saveTicket(updatedTicket)
			}
			readAllTickets()
		} catch {
			print("failed updating ticket")
		}
	}

	func saveTicket(_ ticket: Ticket) -> Bool {
		do {
			let url = FileManager.documentsFolderUrl().appendingPathComponent(ticket.id.uuidString)
			try JSONEncoder().encode(ticket).write(to: url)
			readAllTickets()
		} catch {
			print("failed saving ticket")
			return false
		}
		return true
	}

	private func readAllTickets() {
		var ticketList: [Ticket] = []

		do {
			let files = try FileManager.default.contentsOfDirectory(atPath: FileManager.documentsFolderUrl().path())
			for file in files {
				let path = FileManager.documentsFolderUrl().appendingPathComponent(file).path()
				if let data = FileManager.default.contents(atPath: path),
				   let ticket = try? JSONDecoder().decode(Ticket.self, from: data) {
					ticketList.append(ticket)
				}
			}
		} catch {
			print("failed reading tickets")
		}

		self.tickets = ticketList.sorted(by: { $0.timestamp > $1.timestamp })
	}
}
