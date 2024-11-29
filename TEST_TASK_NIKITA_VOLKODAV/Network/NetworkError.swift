import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case networkError
    case noInternetConnection
    case unauthorized
    case conflict
    case validationFailed
    case tokenSaveError
}
