//
//  Post.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/16.
//

import UIKit
import Foundation

struct Post { // 게시글
    let profile: UIImage
    let name: String
    var title: String
    var content: String
    var image: UIImage?
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
