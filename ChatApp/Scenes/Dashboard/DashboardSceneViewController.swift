//
//  DashboardSceneViewController.swift
//  ChatApp
//
//  Created by Gautam Singh on 22/11/21.
//

import UIKit

class DashboardSceneViewController: UITabBarController {
    var userModel: User!
    var router: DashboardSceneRouter!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }
    @objc func logoutTapped(_ sender: Any) {
        self.router.popToRootController()
    }
    
    @objc func addUserTapped(_ sender: Any) {
      
    }
}

private extension DashboardSceneViewController {
    
}
