import UIKit

enum FontStyle: String {
    case regular = "NunitoSans_7pt-Regular"
    case semibold = "NunitoSans_7pt-SemiBold"
}

extension UIFont {
    static func customFont(style: FontStyle, size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static let regular14 = UIFont.customFont(style: .regular, size: 14)
    static let regular16 = UIFont.customFont(style: .regular, size: 16)
    static let regular18 = UIFont.customFont(style: .regular, size: 18)
    static let regular20 = UIFont.customFont(style: .regular, size: 20)
    static let semibold18 = UIFont.customFont(style: .semibold, size: 18)
    static let semibold10 = UIFont.customFont(style: .semibold, size: 10)
}
