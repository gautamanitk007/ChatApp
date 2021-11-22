//
//  LoginSceneInteractor.swift
//  ChatApp
//
//  Created by Gautam Singh on 20/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import CoreData

typealias LoginSceneInteractorInput = LoginSceneViewControllerOutput

protocol LoginSceneInteractorOutput:AnyObject {
    func logingSuccess(user: User)
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
        if let viewContext = self.coordinator?.viewContext {
            let predicate = NSPredicate(format: "%K == %@ && %K == %@", #keyPath(User.userId),userModel.userId!,#keyPath(User.password),userModel.password!)
            if let user = User.findOrFetch(in: viewContext, matching: predicate){
                self.presenter?.logingSuccess(user: user)
            } else {
                self.presenter?.logingFailed(message: Utils.getLocalisedValue(key:"User_Password_Wrong"))
            }
        } else {
            self.presenter?.logingFailed(message: Utils.getLocalisedValue(key:"ContextError"))
        }
    }
}
