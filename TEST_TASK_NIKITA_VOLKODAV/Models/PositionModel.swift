import Foundation

// MARK: - PositionModel
struct PositionModel: Decodable {
    let positions: [Position]
}

// MARK: - Position
struct Position: Decodable {
    let id: Int
    let name: String
}
