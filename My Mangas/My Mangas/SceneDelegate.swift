//
//  SceneDelegate.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
          
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = CollectionMangasVC(
            layoutFactory: CollectionMangasLayoutFactory()
        )
        window.makeKeyAndVisible()
        self.window = window
    }
}

