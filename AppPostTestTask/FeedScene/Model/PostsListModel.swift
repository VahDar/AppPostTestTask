//
//  PostsListModel.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 27.02.2024.
//

import Foundation

struct PostsListModel: Decodable {
    let posts: [Post]?
}

struct Post: Decodable {
    
    let postId: Int
    let timeshamp: TimeInterval
    let title: String
    let previewText: String
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
            case postId = "postId"
            case timeshamp = "timeshamp"
            case title = "title"
            case previewText = "preview_text"
            case likesCount = "likes_count"
        }
}
