import UIKit

final class SingUpCoordinator: BaseCoordinator {
    
    override func start() {
        let singUpViewController = SingUpViewController()
        singUpViewController.viewModel.coordinator = self
        singUpViewController.configureTabBarItem(title: TextContainer.TabBar.signUp,
                                                 defaultImage: .singUp)
        navigationController.pushViewController(singUpViewController,
                                                animated: true)
    }
}
