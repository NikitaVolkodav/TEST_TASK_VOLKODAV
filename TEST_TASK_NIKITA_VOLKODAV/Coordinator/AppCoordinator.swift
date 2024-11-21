import UIKit

final class AppCoordinator: BaseCoordinator {
    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        super.init(navigationController: navigationController)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    override func start() {
        let launchCoordinator = LaunchCoordinator(navigationController: navigationController)
        launchCoordinator.parentCoordinator = self
        add(coordinator: launchCoordinator)
        launchCoordinator.start()
    }
}
