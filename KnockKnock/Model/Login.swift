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
