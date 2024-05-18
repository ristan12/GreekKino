//
//  KinoDraw.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 17.5.24..
//

import Foundation

struct KinoDraw: Codable, Identifiable {
	struct WinningNumbers: Codable {
		let list: [Int]
	}

	var id: Int { return drawId }

	let gameId: Int
	let drawId: Int
	let drawTime: Double
	let status: String
	let winningNumbers: WinningNumbers?
}

struct PastKinoDrawAPIResponse: Codable {
	let content: [KinoDraw]
}

struct KinoDrawMockData {
	static let draw1 = KinoDraw(gameId: 1100, drawId: 1089257, drawTime: 1715956500000, status: "active", winningNumbers: nil)
	static let draw2 = KinoDraw(gameId: 1100, drawId: 1089258, drawTime: 1715956800000, status: "future", winningNumbers: nil)
	static let draw3 = KinoDraw(gameId: 1100, drawId: 1089259, drawTime: 1715957100000, status: "future", winningNumbers: nil)
	static let draw4 = KinoDraw(gameId: 1100, drawId: 1089260, drawTime: 1715957400000, status: "future", winningNumbers: nil)
	static let draw5 = KinoDraw(gameId: 1100, drawId: 1089261, drawTime: 1715957700000, status: "future", winningNumbers: nil)

	static let draws = [draw1, draw2, draw3, draw4, draw5]
}
