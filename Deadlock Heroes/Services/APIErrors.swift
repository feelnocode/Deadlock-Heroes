//
//  APIErrors.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import Foundation

enum APIErrors: Error {
    case invalidResponseCode
    case decodingError
    case invalidUrl
    case badImage
    case imageDownloadError
}
