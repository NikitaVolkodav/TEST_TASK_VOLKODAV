import Foundation
import UIKit

final class ImageStorageService {
    private var currentImage: UIImage?
    private var currentImageName: String?
    
    func saveImage(_ image: UIImage, withName name: String) {
        currentImage = image
        currentImageName = name
    }
    
    func getImage() -> UIImage? {
        currentImage
    }
    
    func isImageAdded() -> Bool {
        currentImage != nil && currentImageName != nil
    }
}
