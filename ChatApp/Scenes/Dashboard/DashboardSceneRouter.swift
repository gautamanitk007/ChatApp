//
//  DashboardSceneRouter.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import UIKit

protocol DashboardSceneRouting {
    func popToRootController()
}

final class DashboardSceneRouter {
    weak var source: UIViewController?

    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

extension DashboardSceneRouter: DashboardSceneRouting {
    func popToRootController() {
        source?.navigationController?.popToRootViewController(animated: true)
    }
}
