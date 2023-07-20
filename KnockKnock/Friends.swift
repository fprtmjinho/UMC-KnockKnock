//
//  Friend.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/07/14.
//

import Foundation
class Friends {
    static let shared = Friends()
    
    var name: Array<String> = []
    var nickName: Array<String> = []
    var number: Array<String> = []
    var bestFriend: Array<Bool> = []
    var alram: Array<Bool> = []
    var time: Array<String> = []
    
    var hidden: Array<Bool> = []
    
    var choiceIndex: Int?
    
    
    private func Init() {}
}
