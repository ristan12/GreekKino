//
//  Ticket.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import Foundation
import SwiftUI

struct Ticket: Codable, Identifiable {
	enum TicketState: Codable {
		case winning
		case pending
		case loosing
	}

	let id: UUID
	let drawId: String
	let numbers: [Int]
	let quote: Double
	let state: TicketState

	init(id: UUID, drawId: String, numbers: [Int], quote: Double, state: TicketState = .pending) {
		self.id = id
		self.drawId = drawId
		self.numbers = numbers
		self.quote = quote
		self.state = state
	}

	var stateColor: Color {
		switch state {
		case .winning:
			return .green
		case .pending:
			return .gray
		case .loosing:
			return .red
		}
	}
}
