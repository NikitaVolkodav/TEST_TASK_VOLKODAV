import Foundation

enum APIEndpoint: String {
    case users = "/api/v1/users"
    case positions = "/api/v1/positions"
    case token = "/api/v1/token"
    
    var path: String {
        return self.rawValue
    }
}
