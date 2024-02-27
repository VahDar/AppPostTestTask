//
//  NetworkError.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 27.02.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case jsonParsingFailed
    case networkServiceUnvailable
}
