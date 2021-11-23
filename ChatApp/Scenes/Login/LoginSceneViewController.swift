//
//  LoginSceneViewController.swift
//  ChatApp
//
//  Created by Gautam Singh on 20/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
protocol LoginSceneViewControllerInput: AnyObject {
    func loginSuccess(user: User)
    func loginFailed(message: String)
}

protocol LoginSceneViewControllerOutput:AnyObject {
    func startLogin(user userModel: UserModel)
}

final class LoginSceneViewController: UIViewController {
    
    var interactor: LoginSceneInteractorInput!
    var router: LoginSceneRouting!
    var userModel: UserModel?

    @IBOutlet weak var containerView: RoundedView!
    
    @IBOutlet weak var txtPassword: BindingTextField!{
        didSet{
            txtPassword.bind{self.userModel?.password = $0}
        }
    }
    @IBOutlet weak var txtUserId: BindingTextField!{
        didSet{
            txtUserId.bind{self.userModel?.userId = $0}
        }
    }
    
    @IBOutlet weak var btnLogin: RoundedButton!
    @IBOutlet weak var btnAddUser: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.populate()
    }
    @IBAction func didLoginTapped(_ sender: Any) {
        self.view.endEditing(true)
        self.userModel?.userId = "raj003"
        self.userModel?.password = "123456"
        interactor.startLogin(user: self.userModel!)
    }
    @IBAction func didAddUserTapped(_ sender: Any) {
        self.router.showAddUserPage()
    }
}


// MARK: - LoginSceneViewControllerInput
extension LoginSceneViewController: LoginSceneViewControllerInput {
    func loginSuccess(user: User) {
        self.router.showLoginSuccess(user: user)
    }
    func loginFailed(message: String) {
        self.router.showFailure(message: message)
    }
}

// MARK: - Private
private extension LoginSceneViewController {
    func setup() {
        self.txtUserId.delegate = self
        self.txtPassword.delegate = self
        self.txtUserId.placeholder = Utils.getLocalisedValue(key:"UserId_Text_Field_Placeholder")
        self.txtPassword.placeholder = Utils.getLocalisedValue(key:"Password_Text_Field_Placeholder")
        self.btnLogin.setTitle(Utils.getLocalisedValue(key:"Login_Button_Title"), for: .normal)
        self.btnAddUser.setTitle(Utils.getLocalisedValue(key:"Add_User_Button_Title"), for: .normal)
    }
    
    func populate(){
        self.txtUserId.text = self.userModel?.userId
        self.txtPassword.text = self.userModel?.password
        self.txtUserId.textFieldChange(self.txtUserId)
        self.txtPassword.textFieldChange(self.txtPassword)
    }
}

//MARK:- UITextFieldDelegate
extension LoginSceneViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.txtUserId {
            self.txtPassword.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return false
    }
}
