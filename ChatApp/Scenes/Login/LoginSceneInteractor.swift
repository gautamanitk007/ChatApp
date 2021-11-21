//
//  LoginSceneInteractor.swift
//  ChatApp
//
//  Created by Gautam Singh on 20/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

typealias LoginSceneInteractorInput = LoginSceneViewControllerOutput

protocol LoginSceneInteractorOutput:AnyObject {
    func logingSuccess()
    func logingFailed(message: String)
}

final class LoginSceneInteractor {
    var presenter: LoginScenePresenterInput?
    var coordinator: Coordinator?
}


// MARK: - LoginSceneBusinessLogic
extension LoginSceneInteractor: LoginSceneInteractorInput {

    func startLogin(user userModel: UserModel) {
        if userModel.username == nil || userModel.username?.count == 0 {
            self.presenter?.logingFailed(message: Utils.getLocalisedValue(key:"UserName_Empty"))
            return
        }
        if userModel.password == nil || userModel.password?.count == 0 {
            self.presenter?.logingFailed(message:Utils.getLocalisedValue(key:"Password_Empty"))
            return
        }
        
        self.presenter?.logingSuccess()
        
    }
}
