//
//  Group.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/07/24.
//

import Foundation
class Group{
    static let shared = Group()
    
    var dic: [Int:GroupInfo] = [:] //키값 : 생성 시간
    
    var groupMember: [String] = []
    var choiceIndex : Int?
    
    private func Init() {}
}

struct GroupInfo{
    var name: String
    var user: [Int] //전화번호
    var place: String
    var time: String //알람 설정시간
}
