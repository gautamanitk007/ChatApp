//
//  AddUserSceneInteractor.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.

import CoreData

typealias AddUserSceneInteractorInput = AddUserSceneViewControllerOutput

protocol AddUserSceneInteractorOutput:AnyObject {
    func userSuccess(model: UserModel)
    func userFailed(message: String)
}

final class AddUserSceneInteractor {
    var presenter: AddUserScenePresenterInput?
    var coordinator: Coordinator?
}


// MARK: - AddUserSceneInteractorInput
extension AddUserSceneInteractor: AddUserSceneInteractorInput {
    func addUser(userModel: UserModel) {
        
        if userModel.userId == nil || userModel.userId?.count == 0 {
            self.presenter?.userFailed(message:Utils.getLocalisedValue(key:"UserID_Empty"))
            return
        }
        if userModel.username == nil || userModel.username?.count == 0 {
            self.presenter?.userFailed(message: Utils.getLocalisedValue(key:"UserName_Empty"))
            return
        }
        if userModel.password == nil || userModel.password?.count == 0 {
            self.presenter?.userFailed(message:Utils.getLocalisedValue(key:"Password_Empty"))
            return
        }
        
        if let viewContext = self.coordinator?.viewContext {
            let predicate = NSPredicate(format: "%K == %@", #keyPath(User.userId),userModel.userId!)
            if let userObj = User.findOrFetch(in: viewContext, matching: predicate){
                self.presenter?.userFailed(message: String(format: Utils.getLocalisedValue(key:"User_Exist"), userObj.userId!))
            } else {
                let user = User.insert(into: viewContext, model: userModel)
                let _ = user.managedObjectContext?.saveOrRollback()
                self.presenter?.userSuccess(model: userModel)
            }
        } else {
            self.presenter?.userFailed(message: Utils.getLocalisedValue(key:"ContextError"))
        }
    }
}
