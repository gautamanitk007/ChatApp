//
//  FriendsSceneRouter.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.

import Foundation
import UIKit
protocol FriendsSceneRouting: NavigationRouting {
    func loadChat()
}
final class FriendsSceneRouter: NavigationSceneRouter {
    override init(sceneFactory: SceneFactory, coordinator: Coordinator) {
        super.init(sceneFactory: sceneFactory, coordinator: coordinator)
    }
}

extension FriendsSceneRouter: FriendsSceneRouting {
    func loadChat(){
        
    }
}
