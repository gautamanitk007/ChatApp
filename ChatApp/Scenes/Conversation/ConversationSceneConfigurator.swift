//
//  ConversationSceneConfigurator.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import Foundation

protocol ConversationSceneConfigurator {
    func configured(_ vc: ConversationSceneViewController, coordinator:Coordinator) -> ConversationSceneViewController
}

final class DefaultConversationSceneConfigurator: ConversationSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: ConversationSceneViewController, coordinator:Coordinator) -> ConversationSceneViewController{
        sceneFactory.conversationConfigurator = self
        return vc
    }
}
