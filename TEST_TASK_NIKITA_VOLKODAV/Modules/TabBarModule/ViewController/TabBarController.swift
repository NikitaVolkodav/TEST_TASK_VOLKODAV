import UIKit

final class TabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .tabBar
        tabBar.tintColor = .customBlue
        tabBar.unselectedItemTintColor = .gray
        tabBar.isTranslucent = true
    }
}
