//
//  PastDrawsViewModel.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import Foundation

class PastDrawsViewModel: ObservableObject {
	@Published private(set) var pastDraws: [KinoDraw] = []

	func fetchDraws() {
		KinoAPIManager.shared.getPastDraws { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let pastDrawAPIResponse):
					self.pastDraws = pastDrawAPIResponse.content
				case .failure:
					print("failed fetching")
				}
			}
		}
	}
}
