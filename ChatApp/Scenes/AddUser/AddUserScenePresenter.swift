//
//  AddUserScenePresenter.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

typealias AddUserScenePresenterInput = AddUserSceneInteractorOutput
typealias AddUserScenePresenterOutput = AddUserSceneViewControllerInput

final class AddUserScenePresenter {
    weak var viewController: AddUserScenePresenterOutput?
}


// MARK: - AddUserScenePresenterInput
extension AddUserScenePresenter: AddUserScenePresenterInput{
    func userSuccess(message: String) {
        self.viewController?.userAddSuccess(message: message)
    }
    func userFailed(message: String) {
        self.viewController?.userAddFailed(message: message)
    }
}
