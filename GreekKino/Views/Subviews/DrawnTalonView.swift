//
//  DrawnTalonView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct DrawnTalonView: View {
	var pickedNumbers: [Int]
	var color: Color

	var body: some View {
		let numbers = Array(pickedNumbers)
		let columns = Array(repeating: GridItem(.flexible()), count: 8)

		LazyVGrid(columns: columns, content: {
			ForEach(numbers, id: \.self) { number in
				Circle()
					.stroke(Color.black, lineWidth: 2)
					.fill(color)
					.frame(width: 35, height: 35)
					.overlay(
						Text("\(number)")
							.font(.headline)
					)
			}
		})
	}
}

#Preview {
	DrawnTalonView(pickedNumbers: [1, 2, 3, 4], color: .gray)
}
