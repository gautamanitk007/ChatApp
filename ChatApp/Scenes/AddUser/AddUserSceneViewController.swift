//
//  AddUserSceneViewController.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
protocol AddUserSceneViewControllerInput: AnyObject {
    func userAddSuccess(message: String)
    func userAddFailed(message: String)
}

protocol AddUserSceneViewControllerOutput:AnyObject {
    func addUser(userModel: UserModel)
}

final class AddUserSceneViewController: BaseViewController {
    
    var interactor: AddUserSceneInteractorInput!
    var router: AddUserSceneRouting!
    var userModel: UserModel?

    @IBOutlet weak var containerView: RoundedView!
    
    @IBOutlet weak var txtPassword: BindingTextField!{
        didSet{
            txtPassword.bind{self.userModel?.password = $0}
        }
    }
    @IBOutlet weak var txtUsername: BindingTextField!{
        didSet{
            txtUsername.bind{self.userModel?.username = $0}
        }
    }
    @IBOutlet weak var txtUserId: BindingTextField!{
        didSet{
            txtUserId.bind{self.userModel?.userId = $0}
        }
    }
    
    @IBOutlet weak var btnSave: RoundedButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    @IBAction func didSaveTapped(_ sender: Any) {
        self.view.endEditing(true)
        self.startActivity()
        interactor.addUser(userModel: self.userModel!)
    }
    
}


// MARK: - AddUserSceneViewControllerInput
extension AddUserSceneViewController: AddUserSceneViewControllerInput {
    func userAddSuccess(message: String) {
        self.stopActivity()
        self.router.showUserSuccess(message: message)
    }
    
    func userAddFailed(message: String) {
        self.stopActivity()
        self.router.showFailure(message: message)
    }
}
// MARK: - Private
private extension AddUserSceneViewController {
    func setup() {
        self.txtUsername.delegate = self
        self.txtPassword.delegate = self
        self.txtUserId.delegate = self
        self.txtUsername.placeholder = Utils.getLocalisedValue(key:"Login_Text_Field_Placeholder")
        self.txtPassword.placeholder = Utils.getLocalisedValue(key:"Password_Text_Field_Placeholder")
        self.txtUserId.placeholder = Utils.getLocalisedValue(key:"UserId_Text_Field_Placeholder")
        self.btnSave.setTitle(Utils.getLocalisedValue(key:"Save_Button_Title"), for: .normal)
    }
}

//MARK:- UITextFieldDelegate
extension AddUserSceneViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.txtUserId {
            self.txtUsername.becomeFirstResponder()
        }else if textField == self.txtUsername {
            self.txtPassword.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return false
    }
}
