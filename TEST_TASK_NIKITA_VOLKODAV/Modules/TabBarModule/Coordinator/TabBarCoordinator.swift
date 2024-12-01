import UIKit

final class TabBarCoordinator: BaseCoordinator {
    
    override func start() {
        let tabBarController = TabBarController()
        
        let usersNavController = UINavigationController()
        let singUpNavController = UINavigationController()
        
        let usersCoordinator = UsersCoordinator(navigationController: usersNavController)
        usersCoordinator.parentCoordinator = self
        add(coordinator: usersCoordinator)
        usersCoordinator.start()
        
        let singUpCoordinator = SingUpCoordinator(navigationController: singUpNavController)
        singUpCoordinator.parentCoordinator = self
        add(coordinator: singUpCoordinator)
        singUpCoordinator.start()
        
        tabBarController.viewControllers = [
            usersNavController,
            singUpNavController,
        ]
        
        navigationController.setViewControllers([tabBarController], animated: true)
    }
}
