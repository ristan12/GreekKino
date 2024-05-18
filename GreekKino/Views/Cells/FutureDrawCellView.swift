//
//  FutureDrawCellView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct FutureDrawCellView: View {
	let draw: KinoDraw

	var body: some View {
		TimelineView(.periodic(from: .now, by: 1)) { context in
			HStack {
				Text("\(Date.formatAsTime(draw.drawTime / 1000))")
				Spacer()
				Text("\(Date.diffFormatCountdown(draw.drawTime / 1000))")
			}
		}
	}
}

#Preview {
	FutureDrawCellView(draw: KinoDrawMockData.draw1)
}
