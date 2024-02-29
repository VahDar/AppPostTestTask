//
//  DetailScreenModel.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 29.02.2024.
//

import Foundation

struct DetailScreenModel: Decodable {
    let post: DetailPost
}

struct DetailPost: Decodable {
    
    let postId: Int
    let timeshamp: TimeInterval
    let title: String
    let text: String
    let postImage: String
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case timeshamp = "timeshamp"
        case title = "title"
        case text = "text"
        case postImage = "postImage"
        case likesCount = "likes_count"
    }
}
