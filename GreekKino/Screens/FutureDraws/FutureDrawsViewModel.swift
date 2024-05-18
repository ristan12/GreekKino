//
//  FutureDrawsViewModel.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 17.5.24..
//

import Foundation

class FutureDrawsViewModel: ObservableObject {
	@Published private(set) var futureDraws: [KinoDraw] = []

	func fetchDraws() {
		KinoAPIManager.shared.getFutureDraws { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let draws):
					self.futureDraws = draws
				case .failure:
					print("failed fetching")
				}
			}
		}
	}
}
