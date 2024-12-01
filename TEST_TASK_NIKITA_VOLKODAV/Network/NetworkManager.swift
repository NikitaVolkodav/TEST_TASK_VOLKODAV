import Foundation
import Alamofire

protocol NetworkUsers {
    func getUsers(page: String,
                  count: String,
                  completion: @escaping (Result<UsersModel, NetworkError>) -> Void)
}

protocol NetworkSignUp {
    func getPositions(completion: @escaping (Result<PositionModel, NetworkError>) -> Void)
    func getToken(completion: @escaping (Result<String, NetworkError>) -> Void)
    func createUser(name: String,
                    email: String,
                    phone: String,
                    position: Int,
                    photo: Data,
                    token: String,
                    completion: @escaping (Result<UserPostResponse, NetworkError>) -> Void)
}

final class NetworkManager {
    
    private let reachabilityManager = NetworkReachabilityManager()
    
    private lazy var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "frontend-test-assignment-api.abz.agency"
        return components
    }()
    
    private func makeURL(for path: String,
                         queryItems: [URLQueryItem] = []) -> URL? {
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
extension NetworkManager: NetworkUsers {
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
extension NetworkManager: NetworkSignUp {
    func getPositions(completion: @escaping (Result<PositionModel, NetworkError>) -> Void) {
        
        guard let url = makeURL(for: APIEndpoint.positions.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performRequest(with: url, completion: completion)
    }
    
    func getToken(completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let url = makeURL(for: APIEndpoint.token.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performRequest(with: url, decodingType: TokenResponse.self) { result in
            switch result {
            case .success(let tokenResponse):
                completion(.success(tokenResponse.token))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func createUser(name: String,
                    email: String,
                    phone: String,
                    position: Int,
                    photo: Data,
                    token: String,
                    completion: @escaping (Result<UserPostResponse, NetworkError>) -> Void) {
        
        guard let url = makeURL(for: APIEndpoint.users.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let headers: HTTPHeaders = [
            "Token": token
        ]
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(name.utf8), withName: "name")
            multipartFormData.append(Data(email.utf8), withName: "email")
            multipartFormData.append(Data(phone.utf8), withName: "phone")
            multipartFormData.append(Data("\(position)".utf8), withName: "position_id")
            multipartFormData.append(photo, withName: "photo", fileName: "photo.jpg", mimeType: "image/jpeg")
        }, to: url, headers: headers)
        .validate(statusCode: 200..<500)
        .responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(UserPostResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError))
                }
            case .failure(_):
                if let httpResponse = response.response {
                    switch httpResponse.statusCode {
                    case 401:
                        completion(.failure(.unauthorized))
                    case 422:
                        completion(.failure(.validationFailed))
                    case 409:
                        completion(.failure(.conflict))
                    default:
                        completion(.failure(.invalidResponse))
                    }
                } else {
                    completion(.failure(.networkError))
                }
            }
        }
    }
}
