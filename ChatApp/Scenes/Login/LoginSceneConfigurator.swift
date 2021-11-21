//
//  LoginSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//

import Foundation

protocol LoginSceneConfigurator {
    func configured(_ vc: LoginSceneViewController, coordinator:Coordinator) -> LoginSceneViewController
}

final class DefaultLoginSceneConfigurator: LoginSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: LoginSceneViewController, coordinator:Coordinator) -> LoginSceneViewController{
        sceneFactory.configurator = self
        
        let interactor = LoginSceneInteractor()
        let presenter = LoginScenePresenter()
        let router = LoginSceneRouter(sceneFactory: sceneFactory, coordinator: coordinator)
        router.source = vc
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.coordinator = coordinator
        vc.interactor = interactor
        vc.router = router
        vc.userModel = UserModel()
        return vc
    }
}
