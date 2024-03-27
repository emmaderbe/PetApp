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
        let mainVCImage: UIImage?
                if #available(iOS 16, *) {
                    mainVCImage = UIImage(systemName: ImageConstants.iconMainVCTabBarUp16)
                } else {
                    mainVCImage = UIImage(systemName: ImageConstants.iconMainVCTabBarUnder16)
                }
        
        viewControllers = [
            generateVC(viewController: MainVC(),
                       image: mainVCImage,
                       title: StringConstants.titleMainVCTabBarSystemName),
            generateVC(viewController: FavouritesVC(),
                       image: UIImage(systemName: ImageConstants.iconFavouritesVCTabBar),
                       title: StringConstants.titleFavoriteVCTabBarSystemName),
            generateVC(viewController: SettingsViewController(),
                       image: UIImage(systemName: ImageConstants.iconSettingVCTabBar),
                       title: StringConstants.titleSettingVCTabBarSystemName)
        ]
    }
}

// MARK: - generateVC()
extension TabBarController {
    private func generateVC(viewController: UIViewController,
                            image: UIImage?,
                            title: String) -> UINavigationController {
        // setup tabBar
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        
        // add navigationVC
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.navigationBar.tintColor = .accentOrange
        viewController.navigationItem.title = title
        return navVC
    }
}

// MARK: - setTabBarAppearance()
extension TabBarController {
    private func setTabBarAppearance() {
        // tabBar color
        tabBar.backgroundColor = .accentBackground
        tabBar.tintColor = .accentOrange
        tabBar.unselectedItemTintColor = .accentGrey
        
        // tabBar style
        tabBar.itemPositioning = .centered
        tabBar.barStyle = .default
        
        // add line
        tabBar.layer.borderWidth = 0.30
        tabBar.layer.borderColor = UIColor.accentGrey.cgColor
        tabBar.clipsToBounds = true
    }
}

