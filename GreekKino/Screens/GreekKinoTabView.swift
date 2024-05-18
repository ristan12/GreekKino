//
//  GreekKinoTabView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 17.5.24..
//

import SwiftUI

struct GreekKinoTabView: View {
    var body: some View {
		TabView {
			FutureDrawsView()
				.tabItem {
					Image(systemName: "square.and.pencil")
					Text("Draws")
				}
			PastDrawsView()
				.tabItem {
					Image(systemName: "list.bullet.clipboard")
					Text("Results")
				}
			DrawAnimationView()
				.tabItem {
					Image(systemName: "play.rectangle")
					Text("Live Draw")
				}
			TicketsView()
				.tabItem {
					Image(systemName: "ticket")
					Text("Tickets")
				}
		}
		.tint(Color.green)
    }
}

#Preview {
    GreekKinoTabView()
}
