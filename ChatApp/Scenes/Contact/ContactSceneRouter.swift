//
//  ContactSceneRouter.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.

import Foundation
import UIKit
protocol ContactSceneRouting: NavigationRouting {
    func startChat(from fUser: User, with toUser:User)
}
final class ContactSceneRouter: NavigationSceneRouter {
    override init(sceneFactory: SceneFactory, coordinator: Coordinator) {
        super.init(sceneFactory: sceneFactory, coordinator: coordinator)
    }
}

extension ContactSceneRouter: ContactSceneRouting {
    func startChat(from fUser: User, with toUser:User){
        debugPrint(fUser)
        debugPrint(toUser)
    }
}

