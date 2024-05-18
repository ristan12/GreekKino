//
//  TicketsView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct TicketsView: View {
	@StateObject var viewModel = TicketsViewModel()

    var body: some View {
		NavigationStack {
			List(viewModel.tickets) { ticket in
				VStack {
					HStack {
						Text("\(ticket.drawId.description)")
						Spacer()
						Text("\(String(format: "%.2f", ticket.quote))")
					}
					DrawnTalonView(pickedNumbers: ticket.numbers, color: ticket.stateColor)
				}
			}
			.navigationTitle("🇬🇷 Tickets")
		}
		.onAppear {
			TicketManager.shared.checkAllTickets()
		}
    }
}

#Preview {
    TicketsView()
}
