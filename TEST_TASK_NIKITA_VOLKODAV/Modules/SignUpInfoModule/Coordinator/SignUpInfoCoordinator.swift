import UIKit

final class SignUpInfoCoordinator: BaseCoordinator {
    
    let status: InfoViewStatus
    
    init(navigationController: UINavigationController,
         status: InfoViewStatus) {
        self.status = status
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let signUpInfoViewController = SignUpInfoViewController()
        signUpInfoViewController.viewModel.coordinator = self
        signUpInfoViewController.viewModel.status = status
        signUpInfoViewController.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(signUpInfoViewController, animated: true)
    }
    
    func goBackToTabBar() {
        goBack()
    }
}
