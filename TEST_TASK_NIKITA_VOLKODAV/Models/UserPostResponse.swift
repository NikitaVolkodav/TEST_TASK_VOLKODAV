import Foundation

// MARK: - UserPostResponse
struct UserPostResponse: Decodable {
    let success: Bool
    let message: String
    let user_id: Int?
    let fails: [String: [String]]?
}
