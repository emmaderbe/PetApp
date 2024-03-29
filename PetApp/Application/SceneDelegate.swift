import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
            if UserDefaults.standard.bool(forKey: "hasViewedOnboarding") {
                window?.rootViewController = TabBarController()
            } else {
                window?.rootViewController = OnboardingVC()
            }
        
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "Montserrat-SemiBold", size: 17)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

