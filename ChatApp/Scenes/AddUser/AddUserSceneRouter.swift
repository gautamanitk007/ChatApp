//
//  AddUserSceneRouter.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit


protocol AddUserSceneRouting:UserError {
    func showUserSuccess(message:String)
}

final class AddUserSceneRouter {
    weak var source: UIViewController?

    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
}

extension AddUserSceneRouter: AddUserSceneRouting {
    func showUserSuccess(message: String) {
        
    }
    
    func showFailure(message: String) {
        let alertController = Utils.getAlert(title:Utils.getLocalisedValue(key:"Information_Error_Title"),message:message)
        source?.present(alertController, animated: true)
    }
}
