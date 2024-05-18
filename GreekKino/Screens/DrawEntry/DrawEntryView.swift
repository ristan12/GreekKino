//
//  DrawEntryView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct DrawEntryView: View {
	@StateObject var viewModel: DrawEntryViewModel

    var body: some View {
		VStack(spacing: 8.0) {
			DrawEntryHeaderView(draw: viewModel.draw)

			TalonView(pickedNumbers: viewModel.pickedNumbers,
					  numberPickedAction: viewModel.didPickNumber(_:))

			HStack {
				DrawEntryFooterView(numberCount: viewModel.pickedNumbers.count,
									quota: viewModel.currentQuota)

				Spacer()

				Button(action: {
					viewModel.submitTicket()
				}, label: {
					Text("Submit")
						.frame(width: 80, height: 16, alignment: .center)
						.font(.headline)
						.padding()
						.foregroundStyle(Color.white)
				})
				.background(viewModel.submitDisabled ? Color.gray : Color.green)
				.clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
				.disabled(viewModel.submitDisabled)
			}
			.padding()

			Spacer()
		}
		.padding()
		.navigationBarTitleDisplayMode(.inline)
		.alert("Ticket Created", isPresented: $viewModel.ticketCreatedAlert) {
			Button(action: {
				viewModel.reset()
			}) {
				Text("OK")
			}
		}
		.alert("Ticket Not Created", isPresented: $viewModel.ticketCreateFailedAlert) {
			Button(action: {}) {
				Text("OK")
			}
		}
    }
}

#Preview {
	DrawEntryView(viewModel: DrawEntryViewModel(draw: KinoDrawMockData.draw1))
}
