//
//  SceneDelegate.swift
//  TransferInfo
//
//  Created by Vladimir Grishchenkov on 21.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // организуем в SceneDelegate вью контроллер при запуске

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
// 1- создаём сцену
        guard let windowScene = (scene as? UIWindowScene) else { return  }
// 2 - должны активировать(инициализировать) свойство var window: UIWindow? что выше
// с помощью let windowScene
        window = UIWindow(windowScene: windowScene)

// добавляем вью контроллер на вью
// создаем свойства и укзаываем что в нём корневой котнорллер будет ViewController
        let nav = UINavigationController(rootViewController: ViewController())
        nav.isNavigationBarHidden = true //скрываем меню на навигатион котроллере
//делаем его корневым
        window?.rootViewController = nav // делаем корневым
        window?.makeKeyAndVisible() // добавляем на кран
        guard let _ = (scene as? UIWindowScene) else { return }
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

