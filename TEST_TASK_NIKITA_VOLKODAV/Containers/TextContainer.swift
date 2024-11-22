import Foundation

enum TextContainer {
    // MARK: - Launch Screen
    enum LaunchScreen {
        static let appTitle = "TESTTASK"
    }
    
    // MARK: - TabBar
    enum TabBar {
        static let users = "Users"
        static let signUp = "Sign up"
    }
    // MARK: - Users
    enum UsersScreen {
        static let navTitle = "Working with GET request"
    }
    
    // MARK: - Users
    enum SingUpScreen {
        static let navTitle = "Working with POST request"
    }
    
    enum Info {
        static let internetTitle = "There is no internet connection"
        static let emptyTitle = "There are no users yet"
        static let registeredTitle = "User successfully registered"
        static let emailTitle = "That email is already registered"
        static let tryAgain = "Try again"
        static let gotIt = "Got it"
        
    }
}
