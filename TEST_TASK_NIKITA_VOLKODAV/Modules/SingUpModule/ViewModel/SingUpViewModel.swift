import UIKit

final class SingUpViewModel {
    
    weak var coordinator: SingUpCoordinator?
}
// MARK: - Coordinator
extension SingUpViewModel {
    func goBack() {
        coordinator?.goBack()
    }
}
//MARK: - Alerts
extension SingUpViewModel {
    func showChoosePhotoAler(on view: UIViewController) {
        AlertContainer.showAlert(on: view,
                                 for: .choosePhoto(camera: { [weak self] in
            guard let self = self else { return }
            print("Camera")
        }, gallery: {
            print("Gallery")
        }))
    }
}
