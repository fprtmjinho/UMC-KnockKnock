//
//  Friend.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/07/14.
//

import Foundation
import UIKit
class Friends {
    static let shared = Friends()
    //서버 연동시 String에 친구 고유번호
    var dic: [String:Info] = [:]
    var dic1: [Int:Info2] = [:]
    
    var choiceIndex: Int?
    
    
    private func Init() {}
}

struct Info{
    var name: String
    var nickName: String
    var bestFriend: Bool
    var image: String
}
//서버랑 연동시
struct Info2{
    var name: String
    var nickName: String
    var number: String
    var bestFriend: Bool
    var imageURL: String
    var image: UIImage?
}
