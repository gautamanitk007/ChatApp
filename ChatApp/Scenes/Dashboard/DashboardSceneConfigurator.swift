//
//  DashboardSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 22/11/21.
//

import Foundation
protocol DashboardSceneConfigurator {
    func configured(_ vc: DashboardSceneViewController, coordinator:Coordinator) -> DashboardSceneViewController
}

final class DefaultDashboardSceneConfigurator: DashboardSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: DashboardSceneViewController, coordinator:Coordinator) -> DashboardSceneViewController{
        sceneFactory.dashboardConfigurator = self
        return vc
    }
}
