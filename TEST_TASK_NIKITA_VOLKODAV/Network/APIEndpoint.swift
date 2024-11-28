import Foundation

enum APIEndpoint: String {
    case users = "/api/v1/users"
    case positions = "/api/v1/positions"
    
    var path: String {
        return self.rawValue
    }
}
