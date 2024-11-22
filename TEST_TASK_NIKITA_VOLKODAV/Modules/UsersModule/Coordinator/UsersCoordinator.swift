import UIKit

final class UsersCoordinator: BaseCoordinator {
    
    override func start() {
        let usersViewController = UsersViewController()
        usersViewController.viewModel.coordinator = self
        usersViewController.configureTabBarItem(title: TextContainer.TabBar.users,
                                                defaultImage: .users)
        navigationController.pushViewController(usersViewController,
                                                animated: true)
    }
}
