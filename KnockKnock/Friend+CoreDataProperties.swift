//
//  Friend+CoreDataProperties.swift
//  
//
//  Created by 장진호 on 2023/08/04.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var alram: Bool
    @NSManaged public var bestFriend: Bool
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var time: Date?
    @NSManaged public var image: Data?

}
