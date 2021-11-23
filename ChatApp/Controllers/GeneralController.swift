//
//  GeneralController.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import UIKit

class GeneralController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    func setup() {
        let logoutButton = UIBarButtonItem(image: UIImage(named: "logout.png"),
                                           style: .plain, target: self,
                                           action: #selector(self.logoutTapped))
        self.navigationItem.leftBarButtonItem = logoutButton
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add,
                                        target: self, action: #selector(self.addUserTapped))
        self.navigationItem.rightBarButtonItem = refreshButton

    }
    
    @objc func logoutTapped(_ sender: Any) {
        
    }
    
    @objc func addUserTapped(_ sender: Any) {
      
    }
}
