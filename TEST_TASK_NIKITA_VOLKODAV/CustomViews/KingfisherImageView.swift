import UIKit
import Kingfisher

final class KingfisherImageView: UIImageView {

    func loadImage(from urlString: String?,
                   defaultImage: UIImage?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = defaultImage
            return
        }

        let retryStrategy = DelayRetryStrategy(maxRetryCount: 3,
                                               retryInterval: .seconds(0))

        let options: KingfisherOptionsInfo = [
            .cacheOriginalImage,
            .retryStrategy(retryStrategy),
            .fromMemoryCacheOrRefresh
        ]

        self.kf.indicatorType = .activity

        self.kf.setImage(with: url, options: options) { result in
            switch result {
            case .success(let value):
#warning("FIX DEFAULT Value")
                if let loadedImage = value.image.pngData(),
                   loadedImage.count == 8100 || loadedImage.count == 8015 {
                    self.image = defaultImage
                }
            case .failure:
                self.image = defaultImage
            }
        }
    }
}
