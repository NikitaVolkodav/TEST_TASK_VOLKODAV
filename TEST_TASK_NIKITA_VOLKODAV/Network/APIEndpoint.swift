import Foundation

enum APIEndpoint: String {
    case users = "/api/v1/users"
    
    var path: String {
        return self.rawValue
    }
}
