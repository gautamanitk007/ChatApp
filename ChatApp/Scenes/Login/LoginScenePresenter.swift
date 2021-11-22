//
//  LoginScenePresenter.swift
//  ChatApp
//
//  Created by Gautam Singh on 20/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

typealias LoginScenePresenterInput = LoginSceneInteractorOutput
typealias LoginScenePresenterOutput = LoginSceneViewControllerInput

final class LoginScenePresenter {
    weak var viewController: LoginScenePresenterOutput?
}


// MARK: - LoginScenePresentationLogic
extension LoginScenePresenter: LoginScenePresenterInput{
    func logingSuccess(user: User) {
        self.viewController?.loginSuccess(user: user)
    }
    
    func logingFailed(message: String) {
        self.viewController?.loginFailed(message: message)
    }
}
