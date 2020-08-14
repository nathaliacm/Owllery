//
//  SceneDelegate.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 13/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ViewController() // Your initial view controller.
        window.makeKeyAndVisible()
        self.window = window
    }

}

