//
//  TalonView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI

struct TalonView: View {
	var pickedNumbers: Set<Int>
	let numberPickedAction: ((Int) -> Void)?

    var body: some View {
		let numbers = Array(1...80)
			let columns = Array(repeating: GridItem(.flexible()), count: 8)

		LazyVGrid(columns: columns, content: {
			ForEach(numbers, id: \.self) { number in
				Circle()
					.stroke(Color.black, lineWidth: 2)
					.fill(pickedNumbers.contains(number) ? Color.green : Color.clear)
					.frame(width: 35, height: 35)
					.overlay(
						Text("\(number)")
							.font(.headline)
					)
					.onTapGesture {
						numberPickedAction?(number)
					}
			}
		})
    }
}

#Preview {
	TalonView(pickedNumbers: [], numberPickedAction: nil)
}
