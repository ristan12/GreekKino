//
//  DrawEntryHeaderView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct DrawEntryHeaderView: View {
	let draw: KinoDraw

    var body: some View {
		HStack {
			Text("Time of Draw:")
			Text("\(Date.formatAsTime(draw.drawTime / 1000))")
				.fontWeight(.bold)
		}

		HStack {
			Text("Draw Identification:")
			Text("\(String(draw.drawId))")
				.fontWeight(.bold)
		}

		TimelineView(.periodic(from: .now, by: 1)) { context in
			HStack {
				Text("Time Left:")
				Text("\(Date.diffFormatCountdown(draw.drawTime / 1000))")
					.fontWeight(.bold)
			}
		}
    }
}

#Preview {
	DrawEntryHeaderView(draw: KinoDrawMockData.draw1)
}
