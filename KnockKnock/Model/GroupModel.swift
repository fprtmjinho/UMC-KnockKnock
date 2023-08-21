//
//  GroupModel.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/08/20.
//

import Foundation

struct GroupData: Codable{
    let gatheringId: Int
    let title: String
}

struct GroupDataGet: Codable{
    let statusCode: Int
    let message: String
    let data: [GroupData]
}

struct PostGroupRequest: Codable{
    let title: String
    let gathringMemberIds: [Int]
    let location: String
}

struct PostGroupResponse: Codable{
    let statusCode: Int
    let message: String
    let data: String
}
