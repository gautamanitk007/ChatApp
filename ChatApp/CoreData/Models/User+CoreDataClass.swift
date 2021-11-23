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
    static func insert(into mContext: NSManagedObjectContext, model:UserModel) -> User {
        let user : User = mContext.insertObject()
        user.userId = model.userId
        user.password = model.password
        user.name = model.username
        user.loginId = Date().convertToString()
        return user
    }
}

extension User: Managed{
    @objc(defaultSortDescriptors) public static var defaultSortDescriptors : [NSSortDescriptor]{
        return [NSSortDescriptor(key: #keyPath(name), ascending: true)]
    }
}
