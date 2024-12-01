import UIKit

enum AlertType {
    case choosePhoto(camera: () -> Void, gallery: () -> Void)
    case needPermissionToCameraAndGallery(goToSettings: () -> Void)
}

struct AlertContainer {
    static func showAlert(on viewController: UIViewController, for type: AlertType) {
        switch type {
        case .choosePhoto(let camera, let gallery):
            let alertController = UIAlertController(title: "Choose how you want to add a photo",
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Camera",
                                                    style: .default) { _ in camera() })
            alertController.addAction(UIAlertAction(title: "Gallery",
                                                    style: .default) { _ in gallery() })
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            viewController.present(alertController,
                                   animated: true)
        case .needPermissionToCameraAndGallery(let settings):
            let alertController = UIAlertController(title: "Permission Needed to Upload Photo",
                                                    message: nil,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Settings",
                                                    style: .default) { _ in settings() })
            alertController.addAction(UIAlertAction(title: "Cancel",
                                                    style: .cancel))
            viewController.present(alertController,
                                   animated: true)
        }
    }
}
