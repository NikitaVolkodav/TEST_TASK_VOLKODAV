import Foundation
import Alamofire

protocol NetworkGettable {
    func getUsers(page: String,
                  count: String,
                  completion: @escaping (Result<UsersModel, NetworkError>) -> Void )
}

protocol NetworkPostable {
    func createUser()
}

final class NetworkManager {
    //https://frontend-test-assignment-api.abz.agency/api/v1/users?page=1&count=5
    
    private let reachabilityManager = NetworkReachabilityManager()
    
    private lazy var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "frontend-test-assignment-api.abz.agency"
        return components
    }()
    
    private func makeURL(for path: String,
                         queryItems: [URLQueryItem]) -> URL? {
        var components = urlComponents
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    private func isNetworkReachable() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    private func performRequest<T: Decodable>(with url: URL,
                                              completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard isNetworkReachable() else {
            completion(.failure(.noInternetConnection))
            return
        }
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
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
extension NetworkManager: NetworkGettable {
    func getUsers(page: String,
                  count: String,
                  completion: @escaping (Result<UsersModel, NetworkError>) -> Void) {
        let queryItems = [
            QueryParameter.page(page).queryItem,
            QueryParameter.count(count).queryItem,
        ]
        
        guard let url = makeURL(for: APIEndpoint.users.path,
                                queryItems: queryItems) else {
            completion(.failure(.invalidURL))
            return
        }
        performRequest(with: url, completion: completion)
    }
}
