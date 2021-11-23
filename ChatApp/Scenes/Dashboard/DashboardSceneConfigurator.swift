//
//  DashboardSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 22/11/21.
//

import Foundation
import UIKit

protocol DashboardSceneConfigurator {
    func configured(_ vc: DashboardSceneViewController, coordinator:Coordinator, user: User) -> DashboardSceneViewController
}

final class DefaultDashboardSceneConfigurator: DashboardSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: DashboardSceneViewController, coordinator:Coordinator, user: User) -> DashboardSceneViewController {
        sceneFactory.dashboardConfigurator = self
        vc.userModel = user
        
        let contactSceneFactory = DefaultSceneFactory()
        contactSceneFactory.contactConfigurator = DefaultContactSceneConfigurator(sceneFactory: contactSceneFactory)
        let contactSceneVC = contactSceneFactory.makeContactScene(coordinator: coordinator)
        
       
        let friendsSceneFactory = DefaultSceneFactory()
        friendsSceneFactory.friendsConfigurator = DefaultFriendsSceneConfigurator(sceneFactory: friendsSceneFactory)
        let friendsSceneVC = friendsSceneFactory.makeFriendsScene(coordinator: coordinator)
        
        let conactNavController = createNavController(for: contactSceneVC,
                                                      title: Utils.getLocalisedValue(key: "Contact"),
                                               image: UIImage(named: "user.png"))
        
        let friendsNavController = createNavController(for: friendsSceneVC,
                                                      title: Utils.getLocalisedValue(key: "Friends"),
                                               image: UIImage(named: "chat.png"))
        
        vc.viewControllers = [conactNavController, friendsNavController]
        let router = DashboardSceneRouter(sceneFactory: sceneFactory)
        router.source = vc
        vc.router = router
        return vc
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                                  title: String,
                                                  image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }
}
