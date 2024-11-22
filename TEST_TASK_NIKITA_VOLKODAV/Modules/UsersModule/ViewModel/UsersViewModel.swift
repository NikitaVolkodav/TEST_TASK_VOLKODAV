import Foundation

final class UsersViewModel {
    
    weak var coordinator: UsersCoordinator?
}
// MARK: - Coordinator
extension UsersViewModel {
    func goBack() {
        coordinator?.goBack()
    }
}
