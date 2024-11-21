import UIKit

final class LaunchCoordinator: BaseCoordinator {
    
    override func start() {
        let launchViewController = LaunchViewController()
        launchViewController.viewModel.coordinator = self
        navigationController.pushViewController(launchViewController, animated: true)
    }
    
    func runTabBar() {
    }
}
