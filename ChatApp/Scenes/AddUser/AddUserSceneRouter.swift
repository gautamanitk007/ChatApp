//
//  AddUserSceneRouter.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit


protocol AddUserSceneRouting:UserError {
    func popController(userModel:UserModel)
}

final class AddUserSceneRouter {
    weak var source: UIViewController?

    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

extension AddUserSceneRouter: AddUserSceneRouting {

    func showFailure(message: String) {
        let alertController = Utils.getAlert(title:Utils.getLocalisedValue(key:"Information_Error_Title"),message:message)
        source?.present(alertController, animated: true)
    }
    func popController(userModel: UserModel) {
        if let controllers = source?.navigationController?.viewControllers {
            for controller in controllers  {
                if controller.isKind(of: LoginSceneViewController.self){
                    (controller as! LoginSceneViewController).userModel = userModel
                    break
                }
            }
        }
        source?.navigationController?.popViewController(animated: true)
    }
}
