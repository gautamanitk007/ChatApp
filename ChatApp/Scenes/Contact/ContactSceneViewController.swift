//
//  ContactSceneViewController.swift
//  ChatApp
//


import UIKit

final class ContactSceneViewController: GeneralController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
  }
    @objc override func logoutTapped(_ sender: Any) {
        self.dismiss(animated: true) {
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    @objc override func addUserTapped(_ sender: Any) {
      
        //self.router.popToPrevious()
    }
}

