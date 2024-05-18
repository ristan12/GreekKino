//
//  KinoAPI.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 17.5.24..
//

import Foundation

enum NetworkError: Error {
	case invalidURL
	case invalidResponse
	case invalidData
	case unableToComplete
}

class KinoAPIManager {
	static let shared = KinoAPIManager()
	private init() {}

	private let futureDrawsURL = "https://api.opap.gr/draws/v3.0/1100/upcoming/20"
	private let previousDrawsURL = "https://api.opap.gr/draws/v3.0/1100/draw-date/{fromDate}/{toDate}​"
	private let drawDataURL = "https://api.opap.gr/draws/v3.0/1100/{drawId}"

	func getRequest<T: Codable>(url: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
		guard let url = URL(string: url) else {
			completion(.failure(.invalidURL))
			return
		}

		let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
			guard error == nil else {
				completion(.failure(.unableToComplete))
				return
			}

			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				completion(.failure(.invalidResponse))
				return
			}

			guard let data else {
				completion(.failure(.invalidData))
				return
			}

			do {
				let decoder = JSONDecoder()
				let decodedResponse = try decoder.decode(T.self, from: data)
				completion(.success(decodedResponse))
			} catch {
				completion(.failure(.invalidData))
			}
		}

		task.resume()
	}

	func getFutureDraws(completion: @escaping (Result<[KinoDraw], NetworkError>) -> Void) {
		getRequest(url: futureDrawsURL, completion: completion)
	}

	func getPastDraws(completion: @escaping (Result<PastKinoDrawAPIResponse, NetworkError>) -> Void) {
		let previousDrawsURLString = 
		previousDrawsURL
			.replacingOccurrences(of: "{fromDate}", with: Date.formatAsYearMonthDay(Date.now))
			.replacingOccurrences(of: "{toDate}​", with: Date.formatAsYearMonthDay(Date.now))

		getRequest(url: previousDrawsURLString, completion: completion)
	}

	func getDrawData(drawId: String, completion: @escaping (Result<KinoDraw, NetworkError>) -> Void) {
		let drawDataURLString = drawDataURL.replacingOccurrences(of: "{drawId}", with: drawId)
		getRequest(url: drawDataURLString, completion: completion)
	}
}
