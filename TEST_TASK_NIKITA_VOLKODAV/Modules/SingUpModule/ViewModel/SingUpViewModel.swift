import UIKit

final class SingUpViewModel {
    private let networkManager: NetworkSignUp = NetworkManager()
    private var positionModel: PositionModel?
    weak var coordinator: SingUpCoordinator?
    var selectedItemIndex = IndexPath(item: 0, section: 0)
    
    @ObservableValue var isLoading: Bool = false

    func loadPositions() {
        isLoading = true
        getPositions { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
        }
    }
}
//MARK: - Network
private extension SingUpViewModel {
    func getPositions(completion: @escaping () -> Void) {
        networkManager.getPositions { [weak self] result in
            defer { completion() }
            guard let self = self else { return }
            switch result {
            case .success(let success):
                positionModel = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
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
//MARK: - DataSource
extension SingUpViewModel {
    func numberOfItems() -> Int {
        positionModel?.positions.count ?? 0
    }
    
    func setPositionDetails(at indexPath: IndexPath) -> String {
        guard let users = positionModel?.positions[indexPath.item] else {
            return ""
        }
        
        return users.name
    }
}
