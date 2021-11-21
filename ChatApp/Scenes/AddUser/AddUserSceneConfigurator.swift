//
//  AddUserSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//

import Foundation
protocol AddUserSceneConfigurator {
    func configured(_ vc: AddUserSceneViewController, coordinator:Coordinator) -> AddUserSceneViewController
}

final class DefaultAddUserSceneConfigurator: AddUserSceneConfigurator {

    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: AddUserSceneViewController, coordinator:Coordinator) -> AddUserSceneViewController {
        sceneFactory.addUserConfigurator = self
        let interactor = AddUserSceneInteractor()
        let presenter = AddUserScenePresenter()
        let router = AddUserSceneRouter(sceneFactory: sceneFactory)
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
