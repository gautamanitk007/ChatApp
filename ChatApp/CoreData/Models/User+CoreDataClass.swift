//
//  User+CoreDataClass.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    static func insert(into mContext: NSManagedObjectContext, name: String,userId:String, password: String) -> User {
        let user : User = mContext.insertObject()
        user.userId = userId
        user.password = password
        user.name = name
        user.loginId = Date().convertToString()
        return user
    }
}

extension User: Managed{
    @objc(defaultSortDescriptors) public static var defaultSortDescriptors : [NSSortDescriptor]{
        return [NSSortDescriptor(key: #keyPath(name), ascending: false)]
    }
}
