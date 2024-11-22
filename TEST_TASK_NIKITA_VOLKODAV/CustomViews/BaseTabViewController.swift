import UIKit

class BaseTabViewController: UIViewController {
    
    func configureTabBarItem(title: String, defaultImage: UIImage?) {
        tabBarItem.title = title
        tabBarItem.image = defaultImage?.withRenderingMode(.alwaysOriginal).withTintColor(.gray)
        tabBarItem.selectedImage = defaultImage?.withRenderingMode(.alwaysOriginal).withTintColor(.customBlue)
        
        let fontAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium)
        ]
        UITabBarItem
            .appearance()
            .setTitleTextAttributes(fontAttributes, for: .normal)
    }
}
