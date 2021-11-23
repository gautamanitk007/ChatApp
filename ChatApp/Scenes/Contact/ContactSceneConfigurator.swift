//
//  ContactSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import Foundation
protocol ContactSceneConfigurator {
    func configured(_ vc: ContactSceneViewController, coordinator:Coordinator, user:User) -> ContactSceneViewController
}

final class DefaultContactSceneConfigurator: ContactSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: ContactSceneViewController, coordinator:Coordinator, user:User) -> ContactSceneViewController{
        sceneFactory.contactConfigurator = self
        let router = ContactSceneRouter(sceneFactory: sceneFactory, coordinator: coordinator)
        router.source = vc
        vc.router = router
        vc.user = user
        vc.viewContext = coordinator.viewContext
        return vc
    }
}
