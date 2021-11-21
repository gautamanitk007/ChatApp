//
//  AddUserSceneInteractor.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.

typealias AddUserSceneInteractorInput = AddUserSceneViewControllerOutput

protocol AddUserSceneInteractorOutput:AnyObject {
    func userSuccess(message: String)
    func userFailed(message: String)
}

final class AddUserSceneInteractor {
    var presenter: AddUserScenePresenterInput?
    var coordinator: Coordinator?
}


// MARK: - AddUserSceneInteractorInput
extension AddUserSceneInteractor: AddUserSceneInteractorInput {
    func addUser(userModel: UserModel) {
        
    }
}
