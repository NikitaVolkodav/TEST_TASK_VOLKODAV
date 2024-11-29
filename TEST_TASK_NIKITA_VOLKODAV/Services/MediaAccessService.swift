import UIKit
import AVFoundation
import Photos

enum ImageSource {
    case gallery
    case camera
}

final class MediaAccessService {
    
    static func requestCameraPermission(completion: @escaping (Bool) -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            completion(true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        default:
            completion(false)
        }
    }
    
    static func requestPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            completion(true)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    completion(status == .authorized)
                }
            }
        default:
            completion(false)
        }
    }
    
    static func openImagePicker(on viewController: UIViewController,
                         source: ImageSource,
                         completion: @escaping (Bool) -> Void) {
        switch source {
        case .gallery:
            requestPhotoLibraryPermission { granted in
                if granted, UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    self.presentImagePicker(on: viewController, sourceType: .photoLibrary)
                    completion(true)
                } else {
                    completion(false)
                }
            }
        case .camera:
            requestCameraPermission { granted in
                if granted, UIImagePickerController.isSourceTypeAvailable(.camera) {
                    self.presentImagePicker(on: viewController, sourceType: .camera)
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    private static func presentImagePicker(on viewController: UIViewController,
                                    sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = viewController as? (UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = sourceType
        viewController.present(imagePickerController, animated: true, completion: nil)
    }
}
