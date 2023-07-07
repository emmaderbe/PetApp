import UIKit

// MARK: - viewDidLoad()
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
}

// MARK: - generateTabBar()
extension TabBarController {
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MainVC(),
                       image: UIImage(named: StringConstants.iconMainVCTabBarSystemName),
                       title: StringConstants.titleMainVCTabBarSystemName),
            generateVC(viewController: FavouritesVC(),
                       image: UIImage(named: StringConstants.iconFavouritesVCTabBarSystemName),
                       title: StringConstants.titleFavoriteVCTabBarSystemName)
        ]
    }
}

// MARK: - generateVC()
extension TabBarController {
    private func generateVC(viewController: UIViewController,
                            image: UIImage?,
                            title: String) -> UINavigationController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.navigationBar.tintColor = .accentOrange
        viewController.navigationItem.title = title
        return navVC
    }
}

// MARK: - setTabBarAppearance()
extension TabBarController {
    private func setTabBarAppearance() {
        tabBar.backgroundColor = .accentBackground
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .accentOrange
        tabBar.barStyle = .default
        tabBar.unselectedItemTintColor = .accentGrey
    }
}

