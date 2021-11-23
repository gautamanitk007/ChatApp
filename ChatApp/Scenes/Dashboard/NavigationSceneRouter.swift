//
//  NavigationSceneRouter.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import UIKit

protocol NavigationRouting {
    func popToRootController()
    func showAddUserPage()
}
 
class NavigationSceneRouter {
    weak var source: UIViewController?
    private let sceneFactory: SceneFactory
    private let coordinator: Coordinator
    init(sceneFactory: SceneFactory, coordinator:Coordinator) {
        self.sceneFactory = sceneFactory
        self.coordinator = coordinator
    }
}

extension NavigationSceneRouter: NavigationRouting {
    func popToRootController() {
        source?.dismiss(animated: true, completion: { [weak self] in
            guard let self = self else {return}
            self.source?.navigationController?.popToRootViewController(animated: true)
        })
    }
    func showAddUserPage() {
        let sceneFactory = DefaultSceneFactory()
        sceneFactory.addUserConfigurator = DefaultAddUserSceneConfigurator(sceneFactory: sceneFactory)
        let scene = sceneFactory.makeAddUserScene(coordinator: self.coordinator)
        source?.navigationController?.pushViewController(scene, animated: true)
    }
}
