//
//  MyData.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/07/17.
//

import Foundation
class MyData {
    static let shared = MyData()
    
    var name: String = ""
    var nickName: String = ""
    var sex: String = ""
    var birthday: String = ""
    //내 멘트
    var myText: String = ""
    
    
    private func Init() {}
}
