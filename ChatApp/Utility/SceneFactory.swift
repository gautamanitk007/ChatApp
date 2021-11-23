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
    
    var contactConfigurator: ContactSceneConfigurator! { get set }
    var friendsConfigurator: FriendsSceneConfigurator! { get set }
    var conversationConfigurator: ConversationSceneConfigurator! { get set }
    func makeLoginScene(coordinator: Coordinator) -> LoginSceneViewController
    func makeAddUserScene(coordinator: Coordinator) -> AddUserSceneViewController
    func makeDashboardScene(coordinator: Coordinator, user: User) -> DashboardSceneViewController
    func makeContactScene(coordinator: Coordinator, user:User) -> ContactSceneViewController
    func makeFriendsScene(coordinator: Coordinator, user:User) -> FriendsSceneViewController
    func makeConversationScene(coordinator: Coordinator) -> ConversationSceneViewController
}

final class DefaultSceneFactory: SceneFactory {
    var addUserConfigurator: AddUserSceneConfigurator!
    var configurator: LoginSceneConfigurator!
    var dashboardConfigurator: DashboardSceneConfigurator!
    var contactConfigurator: ContactSceneConfigurator!
    var friendsConfigurator: FriendsSceneConfigurator!
    var conversationConfigurator: ConversationSceneConfigurator!
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
    
    func makeContactScene(coordinator: Coordinator, user:User) -> ContactSceneViewController {
        let contactVC = self.getViewController(identifier: "ContactScene") as! ContactSceneViewController
        return contactConfigurator.configured(contactVC, coordinator: coordinator, user: user)
    }
    
    func makeFriendsScene(coordinator: Coordinator, user:User) -> FriendsSceneViewController {
        let friendsVC = self.getViewController(identifier: "FriendScene") as! FriendsSceneViewController
        return friendsConfigurator.configured(friendsVC, coordinator: coordinator, user:user)
    }
    
    func makeConversationScene(coordinator: Coordinator) -> ConversationSceneViewController {
        let conversationVC = self.getViewController(identifier: "ConversationScene") as! ConversationSceneViewController
        return conversationConfigurator.configured(conversationVC, coordinator: coordinator)
    }
}

private extension DefaultSceneFactory{
    func getViewController(identifier:String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
