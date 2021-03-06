//
//  LoginSceneRouter.swift
//  ChatApp
//
//  Created by Gautam Singh on 20/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

protocol UserError {
    func showFailure(message: String)
}

protocol LoginSceneRouting:UserError {
    func showLoginSuccess(user:User)
    func showAddUserPage()
    func userAddSuccess(message:String)
}

final class LoginSceneRouter {
    weak var source: UIViewController?
    private let coordinator: Coordinator
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory, coordinator:Coordinator) {
        self.sceneFactory = sceneFactory
        self.coordinator = coordinator
    }
}

extension LoginSceneRouter: LoginSceneRouting {
    func showFailure(message: String) {
        let alertController = Utils.getAlert(title:Utils.getLocalisedValue(key:"Information_Error_Title"),message:message)
        source?.present(alertController, animated: true)
    }
    
    func showLoginSuccess(user: User) {
        let sceneFactory = DefaultSceneFactory()
        sceneFactory.dashboardConfigurator = DefaultDashboardSceneConfigurator(sceneFactory: sceneFactory)
        let scene = sceneFactory.makeDashboardScene(coordinator: self.coordinator,user: user)
        scene.modalPresentationStyle = .fullScreen
        source?.present(scene, animated: true, completion: nil)
    }
    func showAddUserPage() {
        let sceneFactory = DefaultSceneFactory()
        sceneFactory.addUserConfigurator = DefaultAddUserSceneConfigurator(sceneFactory: sceneFactory)
        let scene = sceneFactory.makeAddUserScene(coordinator: self.coordinator)
        source?.navigationController?.pushViewController(scene, animated: true)
    }
    func userAddSuccess(message:String) {
        let alertController = Utils.getAlert(title:Utils.getLocalisedValue(key:"User_Add_Success_Title"),message:message)
        source?.present(alertController, animated: true)
    }
}
