//
//  User.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/08/23.
//

import Foundation

struct EditUserRequest: Codable {
    let request: EditUserData
    let profileImage: Data?
}

struct EditUserData: Codable {
    let nickName: String?
    let birthday: String?
}
