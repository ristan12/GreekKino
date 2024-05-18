//
//  PastDrawsView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct PastDrawsView: View {
	@StateObject private var viewModel: PastDrawsViewModel = PastDrawsViewModel()

    var body: some View {
		NavigationStack {
			List(viewModel.pastDraws) { draw in
				VStack {
					HStack {
						Text("\(Date.formatAsTime(draw.drawTime / 1000))")
						Spacer()
						Text("\(draw.drawId.description)")
					}
					DrawnTalonView(pickedNumbers: draw.winningNumbers?.list ?? [], color: .green)
				}
			}
			.navigationTitle("🇬🇷 Results")
		}
		.onAppear {
			viewModel.fetchDraws()
		}
    }
}

#Preview {
    PastDrawsView()
}
