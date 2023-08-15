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
    let memberGender: String
    let profileImageUrl: String
    let nickName: String
    let email: String
    let birthday: String
    let age: Int
    let createdAt: String
    let modifiedAt: String
}

struct SignUpRequest: Codable {
    let request: SignUpData
    let profileImage: Data?
}

struct SignUpData: Codable {
    let memberGender: String
    let nickName: String
    let email: String
    let birthday: String
    let password: String
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

struct EmailCheckRequest: Codable {
    let email: String
    let code: String
}

struct PWEmailCheckRequest: Codable {
    let code: String
}

struct EmailCheckRequestResult: Codable {
    let statusCode: Int?
    let message: String?
    let data: String?
}

struct PWEmailCheckRequestResult: Codable {
    let statusCode: Int?
    let message: String?
    let data: Int?
}

struct ChangePassword: Codable {
    let memberId: Int
    let newPassword: String
}

struct ChangePasswordResponse: Codable {
    let statusCode: Int?
    let message: String?
    let data: String?
}
