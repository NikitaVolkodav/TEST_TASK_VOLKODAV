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
        
        
        static let name = "Your name"
        static let email = "Email"
        static let phone = "Phone"
        static let phoneMask = "+38 (XXX) XXX - XX - XX"
        static let photo = "Upload your photo"
        static let upload = "Upload"
        
        static let selectPosition = "Select your position"
        static let front = "Frontend developer"
        static let back = "Backend developer"
        static let designer = "Designer"
        static let qa = "QA"
        
        static let signUp = "Sign up"
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
