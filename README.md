
# Project README

This project is built using Xcode and utilizes the following third-party libraries to enhance its functionality:

## Configuration Options
The project uses standard configurations for building iOS applications. No additional customizations are required.

## Dependencies
The project includes the following external libraries:
1. **Kingfisher**: A powerful library for downloading and caching images from the web.
2. **Alamofire**: A robust library for handling network requests and responses.

### Kingfisher Integration
The `KingfisherImageView` class demonstrates the use of Kingfisher for loading images. It includes features like caching and displaying a default image in case of an error. This implementation is efficient and easy to integrate into your project.

```swift
import UIKit
import Kingfisher

final class KingfisherImageView: UIImageView {

    func loadImage(from urlString: String?, defaultImage: UIImage?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = defaultImage
            return
        }

        let options: KingfisherOptionsInfo = [
            .cacheOriginalImage,
            .fromMemoryCacheOrRefresh
        ]

        self.kf.indicatorType = .activity

        self.kf.setImage(with: url, options: options) { result in
            switch result {
            case .success(let value):
                self.image = value.image
            case .failure:
                self.image = defaultImage
            }
        }
    }
}
```

### Alamofire Integration
The `NetworkManager` class simplifies network requests using Alamofire. It provides features such as:
- Easy handling of `GET` and `POST` requests.
- Built-in error handling for issues like no internet connection.
- Convenient decoding of JSON responses.

```swift
import Foundation
import Alamofire

final class NetworkManager {
    
    private let reachabilityManager = NetworkReachabilityManager()
    
    private lazy var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "frontend-test-assignment-api.abz.agency"
        return components
    }()
    
    private func makeURL(for path: String, queryItems: [URLQueryItem] = []) -> URL? {
        var components = urlComponents
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    private func isNetworkReachable() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    private func performRequest<T: Decodable>(with url: URL,
                                              decodingType: T.Type = T.self,
                                              completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard isNetworkReachable() else {
            completion(.failure(.noInternetConnection))
            return
        }
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(decodingType, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError))
                }
            case .failure(_):
                if let httpResponse = response.response, !(200...299).contains(httpResponse.statusCode) {
                    completion(.failure(.invalidResponse))
                } else {
                    completion(.failure(.networkError))
                }
            }
        }
    }
}
```

## Troubleshooting
- **Issue**: Network requests fail due to lack of internet connectivity.
  **Solution**: The `NetworkManager` class includes a method to check network reachability before making a request.
- **Issue**: Images are not loading.
  **Solution**: Ensure the URL provided is valid and the Kingfisher library is properly integrated.

## Instructions to Build
1. Clone the repository.
2. Open the `.xcodeproj` file using Xcode.
3. Install the dependencies using CocoaPods or Swift Package Manager.
4. Run the project using the standard Xcode build and run commands.

## Documentation
### External APIs and Libraries
- **Kingfisher**: Used for its efficient image loading and caching capabilities.
- **Alamofire**: Chosen for its comprehensive network handling and intuitive syntax.

### Code Structure Overview
- **KingfisherImageView**: Handles image loading with Kingfisher.
- **NetworkManager**: Manages network requests using Alamofire.

