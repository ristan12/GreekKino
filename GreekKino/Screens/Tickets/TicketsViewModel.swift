//
//  TicketsViewModel.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import Foundation
import Combine

class TicketsViewModel: ObservableObject {
	@Published private(set) var tickets: [Ticket] = []

	private var disposeBag = Set<AnyCancellable>()

	init() {
		TicketManager.shared.$tickets.receive(on: RunLoop.main).sink { [weak self] tickets in
			guard let self else { return }
			self.tickets = tickets
		}.store(in: &disposeBag)
	}
}
