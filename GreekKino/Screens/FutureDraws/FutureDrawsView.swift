//
//  FutureDrawsView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 17.5.24..
//

import SwiftUI

struct FutureDrawsView: View {
	@StateObject private var viewModel: FutureDrawsViewModel = FutureDrawsViewModel()

	var body: some View {
		NavigationStack {
			List(viewModel.futureDraws) { draw in
				NavigationLink(destination: DrawEntryView(viewModel: DrawEntryViewModel(draw: draw))) {
					FutureDrawCellView(draw: draw)
				}
			}
			.navigationTitle("🇬🇷 Draws")
		}
		.onAppear {
			viewModel.fetchDraws()
		}
    }
}

#Preview {
    FutureDrawsView()
}
