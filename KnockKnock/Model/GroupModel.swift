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
    let gatheringMemberIds: [Int]
    let location: String
}

struct PostGroupResponse: Codable{
    let statusCode: Int
    let message: String
    let data: String
}

struct Gathering: Codable {
    let title: String
    let gatheringMembers: [GatheringMember]
    let location: String
}

struct GatheringMember: Codable {
    let friendId: Int
    let friendName: String
    let phoneNumber: String?
    let bestFriend: Bool
}
