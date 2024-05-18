//
//  FileManager.swift
//  GreekKino
//
//  Created by Aleksandar Ristanovic on 18.5.24..
//

import Foundation

extension FileManager {
	static func documentsFolderUrl() -> URL {
		let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
		let folderURL = URL(fileURLWithPath: documentsPath)
		return folderURL
	}
}
