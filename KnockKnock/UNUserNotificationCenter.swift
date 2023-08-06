//
//  UNUserNotificationCenter.swift
//  KnockKnock
//
//  Created by 장진호 on 2023/08/06.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by date: DateComponents, id: String) {
        
        // content 만들기
        let content = UNMutableNotificationContent()
        content.title = "알림 제목입니다"
        content.body = "알림 바디입니다. 여기 내용이 들어갑니다."
        content.sound = .default
        content.badge = 1
        
        // trigger 만들기
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        // request 만들기
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
    }
}
