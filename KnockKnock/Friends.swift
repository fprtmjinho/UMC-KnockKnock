//
//  Friend.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/07/14.
//

import Foundation
class Friends {
    static let shared = Friends()
    var dic: [String:Info] = [:]
    
    var choiceNumber: String?
    
    
    private func Init() {}
}

struct Info{
    var name: String
    var nickName: String
    var bestFriend: Bool
    var alram: Bool
    var time: String
}
