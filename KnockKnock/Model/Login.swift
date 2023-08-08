//
//  Login.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/25.
//

import Foundation

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let statusCode: Int
    let message: String
    let data: String
}

struct User: Codable {
    let memberId: Int
    let memberName: String
    let memberGender: String
    let profileImageUrl: String
    let nickName: String
    let phoneNumber: String?
    let email: String
    let birthday: String
    let age: Int
    let createdAt: String
    let modifiedAt: String
}

struct SignUpData: Codable {
    let email: String
    let nickName: String
    let password: String
    let userPhone: String
    let memberName: String
    let memberGender: String
    let birthday: String
}

struct SignUpResponse: Codable {
    let statusCode: Int?
    let message: String?
    let data: String?
}

struct EmailRequest: Codable {
    let email: String?
}

struct EmailReqestResult: Codable {
    let statusCode: Int?
    let message: String?
    let data: String?
}
