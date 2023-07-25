//
//  Post.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/16.
//

import UIKit
import Foundation

struct PostCategory { // 카테고리에서 보이는 게시글
    let profile: UIImage
    var title: String
    var content: String
    var image: UIImage?
    var likes: Int
    var comments: Int
}

struct Post { // 게시글
    var profile: UIImage
    var name: String
    var title: String
    var content: String
    var images: [UIImage?]
    let time: String
    var likes: Int
    var comments: Int
}

struct Comment { // 댓글
    let profile: UIImage
    let name: String
    var text: String
    var time: String
}

struct PostParsing: Codable { // 게시글(게시판에서 보이는)
    var postID: Int
    var boardType: String
    var name: String
    var title: String
    var content: String
    let createdAt: String
    let modifiedAt: String
    var likes: Int
    var comments: Int
    var reports: Int
    var hashtags: [String]
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case boardType
        case name = "nickName"
        case title
        case content
        case createdAt
        case modifiedAt
        case likes = "likeCount"
        case comments = "commentCount"
        case reports = "reportCount"
        case hashtags
    }
}
