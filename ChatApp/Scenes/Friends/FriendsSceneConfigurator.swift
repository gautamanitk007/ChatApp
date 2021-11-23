//
//  FriendsSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import Foundation
protocol FriendsSceneConfigurator {
    func configured(_ vc: FriendsSceneViewController, coordinator:Coordinator) -> FriendsSceneViewController
}

final class DefaultFriendsSceneConfigurator: FriendsSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: FriendsSceneViewController, coordinator:Coordinator) -> FriendsSceneViewController{
        sceneFactory.friendsConfigurator = self
        return vc
    }
}
