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
    var postID: Int
    var profile: String
    var name: String
    var title: String
    var content: String
    var imageURL: [String]
    var images: [UIImage?]
    let time: String
    var likes: Int
    var comments: Int
}

struct Comment: Codable { // 댓글
    let commentId: Int
    let postId: Int
    var profileImageUrl: String
    let nickName: String
    let content: String
    let createdAt: String
    let modifiedAt: String
}

struct Response: Codable {
    var posts: [PostParsing]
    var hasNext: Bool
}

struct PostParsing: Codable { // 게시글(게시판에서 보이는)
    var postID: Int
    var boardType: Int
    var name: String
    var profileImageUrl: String
    var title: String
    var content: String
    var imageUrl: [String]
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
        case profileImageUrl
        case title
        case content
        case imageUrl
        case createdAt
        case modifiedAt
        case likes = "likeCount"
        case comments = "commentCount"
        case reports = "reportCount"
        case hashtags
    }
}

struct PostCreate: Codable {
    let boardType: Int
    let title: String
    let content: String
    let isAnonymous: Bool
}
