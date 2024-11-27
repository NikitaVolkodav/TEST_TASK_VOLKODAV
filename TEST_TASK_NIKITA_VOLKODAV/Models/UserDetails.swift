import Foundation

struct UserDetails {
    var userImage: String?
    var name: String
    var position: String
    var email: String
    var phone: String
}

extension UserDetails {
    static let `default` = UserDetails(
        userImage: nil,
        name: "",
        position: "",
        email: "",
        phone: "")

}
