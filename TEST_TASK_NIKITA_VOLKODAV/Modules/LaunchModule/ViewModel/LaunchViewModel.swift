import Foundation

final class LaunchViewModel {
    
    weak var coordinator: LaunchCoordinator?
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            self?.runTabBar()
        }
    }
}
// MARK: - Coordinator
extension LaunchViewModel {
    private func runTabBar() {
        coordinator?.runTabBar()
    }
    
    func goBack() {
        coordinator?.goBack()
    }
}
