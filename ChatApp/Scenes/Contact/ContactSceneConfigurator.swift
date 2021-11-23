//
//  ContactSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import Foundation
protocol ContactSceneConfigurator {
    func configured(_ vc: ContactSceneViewController, coordinator:Coordinator) -> ContactSceneViewController
}

final class DefaultContactSceneConfigurator: ContactSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: ContactSceneViewController, coordinator:Coordinator) -> ContactSceneViewController{
        sceneFactory.contactConfigurator = self
        return vc
    }
}
