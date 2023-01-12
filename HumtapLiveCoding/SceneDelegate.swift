//
//  SceneDelegate.swift
//  HumtapLiveCoding
//
//  Created by Ruslan Patyk on 11.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let appDIContainer = AppDIContainer()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: scene)
        window?.rootViewController = appDIContainer.makePokeRootViewController()
        window?.makeKeyAndVisible()
    }
}

