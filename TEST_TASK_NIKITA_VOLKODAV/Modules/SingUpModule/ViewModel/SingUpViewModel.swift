import UIKit

final class SingUpViewModel {
    private let networkManager: NetworkSignUp = NetworkManager()
    private var positionModel: PositionModel?
    private var selectedPositionId = 1
    private let imageStorageService = ImageStorageService()
    weak var coordinator: SingUpCoordinator?
    var selectedItemIndex = IndexPath(item: 0, section: 0)
    
    private var name: String = ""
    private var email: String = ""
    private var phone: String = ""
    
    @ObservableValue var isLoading: Bool = false

    func loadPositions() {
        isLoading = true
        
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        getToken { [weak self] in
            guard self != nil else { return }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getPositions { [weak self] in
            guard self != nil else { return }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.isLoading = false
        }
    }
    
    func createUser() {
        guard let photoData = imageStorageService.getImage()?.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        guard let token = KeychainManager.shared.getToken(), !token.isEmpty else {
            return
        }
        networkManager.createUser(name: self.name,
                                  email: self.email,
                                  phone: self.phone,
                                  position: selectedPositionId,
                                  photo: photoData,
                                  token: token) { result in
            switch result {
            case .success(let response):
                print("User registered successfully: \(response)")
                self.handleCreateUserResponse(result: response)
            case .failure(let error):
                print("Failed to register user: \(error)")
            }
        }
    }
    
    private func handleCreateUserResponse(result: UserPostResponse) {
        if result.success {
            runSignUpInfo(with: .registered)
        } else if result.message == "User with this phone or email already exist" {
            runSignUpInfo(with: .email)
        } else {
            return
        }
    }
    
    func updateName(_ newName: String) {
        name = newName
    }

    func updateEmail(_ newEmail: String) {
        email = newEmail
    }

    func updatePhone(_ newPhone: String) {
        phone = newPhone
    }

    func canEnableSignUpButton() -> Bool {
        return ValidationService.isValidName(name) &&
        ValidationService.isValidEmail(email) &&
        ValidationService.isValidPhone(phone) &&
        imageStorageService.isImageAdded()
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
                selectedPositionId = success.positions.first?.id ?? 1
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func getToken(completion: @escaping () -> Void) {
        networkManager.getToken { [weak self] result in
            defer { completion() }
            guard let self = self else { return }
            switch result {
            case .success(let token):
                self.saveToken(token)
            case .failure(let error):
                print("Failed to get token: \(error)")
            }
        }
    }
    
    private func saveToken(_ token: String) {
        if KeychainManager.shared.saveToken(token) {}
    }
}
// MARK: - Coordinator
extension SingUpViewModel {
    func goBack() {
        coordinator?.goBack()
    }
    
    func runSignUpInfo(with status: InfoViewStatus) {
        coordinator?.runSignUpInfo(with: status)
    }
}
//MARK: - Alerts
extension SingUpViewModel {
    
    private func showAlertNeedPermissionToCameraAndGallery(on view: UIViewController) {
        AlertContainer.showAlert(on: view,
                                 for: .needPermissionToCameraAndGallery(goToSettings: { [weak self] in
            guard self != nil else { return }
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                  UIApplication.shared.canOpenURL(settingsUrl) else { return }
            UIApplication.shared.open(settingsUrl)
        }))
    }
    
    func showChoosePhotoAler(on view: UIViewController) {
        AlertContainer.showAlert(on: view,
                                 for: .choosePhoto(camera: { [weak self] in
            guard let self = self else { return }
            MediaAccessService.openImagePicker(on: view, source: .camera) { granted in
                if !granted {
                    self.showAlertNeedPermissionToCameraAndGallery(on: view)
                }
            }
        }, gallery: { [weak self] in
            guard let self = self else { return }
            MediaAccessService.openImagePicker(on: view, source: .gallery) { granted in
                if !granted {
                    self.showAlertNeedPermissionToCameraAndGallery(on: view)
                }
            }
        }))
    }
    
    func handlePickedImage(_ image: UIImage, imageName: String) {
        imageStorageService.saveImage(image, withName: imageName)
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
//MARK: - Delegate
extension SingUpViewModel {
    func didSelectPosition(at indexPath: IndexPath) {
        guard let users = positionModel?.positions[indexPath.item] else {
            return
        }
        self.selectedPositionId = users.id
    }
}
