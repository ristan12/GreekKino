//
//  DrawEntryFooterView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct DrawEntryFooterView: View {
	let numberCount: Int
	let quota: Double

    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Text("Selected Numbers:")
				Text("\(numberCount)/8")
			}
			
			HStack {
				Text("Current Quota:")
				Text("\(String(format: "%.2f", quota))")
			}
		}
    }
}

#Preview {
	DrawEntryFooterView(numberCount: 2, quota: 1.0)
}
