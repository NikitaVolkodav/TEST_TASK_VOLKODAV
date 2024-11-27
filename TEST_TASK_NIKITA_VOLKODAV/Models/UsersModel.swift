import Foundation

// MARK: - UsersModel
struct UsersModel: Decodable  {
    let success: Bool
    let total_pages: Int
    let total_users: Int
    let count: Int
    let page: Int
    let links: Links
    let users: [User]
}
// MARK: - Links
struct Links: Decodable  {
    let next_url: String
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
