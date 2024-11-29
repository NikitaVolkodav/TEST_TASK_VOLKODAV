import Foundation
import UIKit

final class ImageStorageService {
    private var currentImage: UIImage?
    private var currentImageName: String?
    
    func saveImage(_ image: UIImage, withName name: String) {
        currentImage = image
        currentImageName = name
    }
    
    func getImage() -> (UIImage?, String?) {
        (currentImage, currentImageName)
    }
    
    func isImageAdded() -> Bool {
        currentImage != nil && currentImageName != nil
    }
}
