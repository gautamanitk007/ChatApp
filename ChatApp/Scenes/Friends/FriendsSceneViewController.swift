//
//  FriendsSceneViewController.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.


import UIKit
import CoreData
final class FriendsSceneViewController: GeneralController {
  
    var viewContext: NSManagedObjectContext!
    var router: FriendsSceneRouting!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @objc override func logoutTapped(_ sender: Any) {
        self.router.popToRootController()
    }
    
    @objc override func addUserTapped(_ sender: Any) {
        self.router.showAddUserPage()
    }
}
