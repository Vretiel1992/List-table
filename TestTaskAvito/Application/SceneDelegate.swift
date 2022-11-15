//
//  SceneDelegate.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 08.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowsScene)
        let initialVC = EmployeesAssembly.create()
        window.rootViewController = initialVC
        self.window = window
        window.makeKeyAndVisible()
    }
}
