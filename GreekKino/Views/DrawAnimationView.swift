//
//  DrawAnimationView.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import SwiftUI
import WebKit

struct DrawAnimationView: UIViewRepresentable {
	let url: URL = URL(string: "https://mozzartbet.com/sr/lotto-animation/26#")!

	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		let request = URLRequest(url: url)
		uiView.load(request)
	}
}
