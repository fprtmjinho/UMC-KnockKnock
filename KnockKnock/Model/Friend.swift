//
//  Friend.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/08/14.
//

import Foundation

//PostRequest /friend,/friend/create, /friend/{friendId}/edit

struct PostFriendRequest: Codable{
    let friendName: String?
    let nickName: String?
    let phoneNumber: String?
}

struct PostFriendResponse: Codable{
    let statusCode: Int
    let message: String
    let data: String
}

struct FriendData: Codable{
    let friendId: Int
    let friendName: String
    let profileImageURL: String
    let phoneNumber: String
    let bestFriend: Bool
}

struct FriendDataGet: Codable{
    let statusCode: Int
    let message: String
    let data: [FriendData]
}

struct BestFriendData: Codable{
    let friendId: Int
    let friendName: String
    let phoneNumber: String
}

struct BestFriendDataGet: Codable{
    let data: [BestFriendData]
}
