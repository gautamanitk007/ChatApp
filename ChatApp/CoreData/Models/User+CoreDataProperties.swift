//
//  User+CoreDataProperties.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var userId: String?
    @NSManaged public var loginId: String?
    @NSManaged public var password: String?

}

extension User : Identifiable {

}
