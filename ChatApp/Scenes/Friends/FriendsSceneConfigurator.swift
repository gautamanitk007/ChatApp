//
//  FriendsSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import Foundation
protocol FriendsSceneConfigurator {
    func configured(_ vc: FriendsSceneViewController, coordinator:Coordinator, user:User) -> FriendsSceneViewController
}

final class DefaultFriendsSceneConfigurator: FriendsSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: FriendsSceneViewController, coordinator:Coordinator, user:User) -> FriendsSceneViewController{
        sceneFactory.friendsConfigurator = self
        let router = FriendsSceneRouter(sceneFactory: sceneFactory, coordinator: coordinator)
        router.source = vc
        vc.router = router
        vc.user = user
        vc.viewContext = coordinator.viewContext
        return vc
    }
}
