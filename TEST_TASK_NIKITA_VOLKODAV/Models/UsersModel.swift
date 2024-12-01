import Foundation

// MARK: - UsersModel
struct UsersModel: Decodable {
    let success: Bool
    let total_pages: Int
    let count: Int
    let page: Int
    let users: [User]
}
// MARK: - User
struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let position: String
    let position_id: Int
    let registration_timestamp: Int
    let photo: String
}
