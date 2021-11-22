//
//  SceneFactory.swift
//  ChatApp
//
//  Created by Gautam Singh on 21/11/21.
//

import Foundation
import UIKit
protocol SceneFactory {
    var configurator: LoginSceneConfigurator! { get set }
    var addUserConfigurator: AddUserSceneConfigurator! { get set }
    var dashboardConfigurator: DashboardSceneConfigurator! { get set }
    func makeLoginScene(coordinator: Coordinator) -> LoginSceneViewController
    func makeAddUserScene(coordinator: Coordinator) -> AddUserSceneViewController
    func makeDashboardScene(coordinator: Coordinator, user: User) -> DashboardSceneViewController
}

final class DefaultSceneFactory: SceneFactory {
    var addUserConfigurator: AddUserSceneConfigurator!
    var configurator: LoginSceneConfigurator!
    var dashboardConfigurator: DashboardSceneConfigurator!
    func makeLoginScene(coordinator: Coordinator) -> LoginSceneViewController {
        let loginVC = self.getViewController(identifier: "LoginScene") as! LoginSceneViewController
        return configurator.configured(loginVC, coordinator: coordinator)
    }
    func makeAddUserScene(coordinator: Coordinator) -> AddUserSceneViewController {
        let addUserVC = self.getViewController(identifier: "AddUserScene") as! AddUserSceneViewController
        return addUserConfigurator.configured(addUserVC, coordinator: coordinator)
    }
    
    func makeDashboardScene(coordinator: Coordinator, user: User) -> DashboardSceneViewController {
        let dashboardVC = self.getViewController(identifier: "DashboardScene") as! DashboardSceneViewController
        return dashboardConfigurator.configured(dashboardVC, coordinator: coordinator, user: user)
    }
}

private extension DefaultSceneFactory{
    func getViewController(identifier:String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
