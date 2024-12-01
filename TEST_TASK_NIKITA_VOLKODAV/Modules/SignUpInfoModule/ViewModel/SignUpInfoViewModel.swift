import Foundation

final class SignUpInfoViewModel {
    
    weak var coordinator: SignUpInfoCoordinator?
    var status: InfoViewStatus?
    
    func getStatus() -> InfoViewStatus {
        guard let status = status else { return .registered }
        return status
    }
    
}
// MARK: - Coordinator
extension SignUpInfoViewModel {
    func goBack() {
        coordinator?.goBackToTabBar()
    }
}
