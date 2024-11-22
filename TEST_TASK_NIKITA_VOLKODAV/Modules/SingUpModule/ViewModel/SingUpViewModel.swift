import Foundation

final class SingUpViewModel {
    
    weak var coordinator: SingUpCoordinator?
}
// MARK: - Coordinator
extension SingUpViewModel {
    func goBack() {
        coordinator?.goBack()
    }
}
