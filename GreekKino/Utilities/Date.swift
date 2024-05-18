//
//  Date.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 17.5.24..
//

import Foundation

extension Date {
	static func diffFormatCountdown(_ timestamp: Double) -> String {
		let diff = max(0, Date(timeIntervalSince1970: timestamp).timeIntervalSince(Date.now))
		return formatCountdown(diff)
	}
	
	static func formatCountdown(_ timeInterval: TimeInterval) -> String {
		let formatter = DateComponentsFormatter()
		formatter.allowedUnits = [.hour, .minute, .second]
		formatter.unitsStyle = .positional

		return formatter.string(from: timeInterval)!
	}

	static func formatAsTime(_ timeInterval: TimeInterval) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"

		return formatter.string(from: Date(timeIntervalSince1970: timeInterval))
	}

	static func formatAsYearMonthDay(_ date: Date) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"

		return formatter.string(from: date)
	}
}
