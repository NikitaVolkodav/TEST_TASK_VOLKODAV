import Foundation

enum QueryParameter {
    case page(String)
    case count(String)
    
    var queryItem: URLQueryItem {
        switch self {
        case .page(let value):
            return URLQueryItem(name: "page", value: value)
        case .count(let value):
            return URLQueryItem(name: "count", value: value)
        }
    }
}
