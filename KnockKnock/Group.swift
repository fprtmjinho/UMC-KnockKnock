//
//  Group.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/07/24.
//

import Foundation
class Group{
    static let shared = Group()
    
    var dic: [String:GroupInfo] = [:] //키값 : 생성 시간
    
    var choiceTime : String?
    
    private func Init() {}
}

struct GroupInfo{
    var name: String
    var user: [String] //전화번호
    var place: String
    var alram: Bool
    var time: String //알람 설정시간
    //var bestFriend: Bool //모두 찐친일때만
}
