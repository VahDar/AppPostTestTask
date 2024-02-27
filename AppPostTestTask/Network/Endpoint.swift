//
//  Endpoint.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 27.02.2024.
//

import Foundation

enum Endpoint {
    case list
    case detail(id: String)
    
    var path: String {
        switch self {
        case .list:
            return "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        case .detail(id: let id):
            return "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(id).json"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .list:
            return .get
        case .detail:
            return .get
        }
    }
}
