import Foundation

final class UsersViewModel {
    private let networkManager: NetworkUsers = NetworkManager()
    private var allUsers: [User] = []
    private var currentPage: Int = 1
    private var maximumPage: Int?
    weak var coordinator: UsersCoordinator?
    
    @ObservableValue var isLoading: Bool = false
    @ObservableValue var hasError: Bool = false
    @ObservableValue var hasConnectError: Bool = false
    var isLastPage: Bool = false
    
    func loadUsers() {
        if let maximumPage = maximumPage,
           currentPage >= maximumPage {
            isLoading = false
            isLastPage = true
            return
        }
        hasError = false
        hasConnectError = false
        isLoading = true
        
        getUsers(page: "\(currentPage)",
                 count: "6") { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
        }
    }
}
//MARK: - Network
private extension UsersViewModel {
    func getUsers(page: String,
                  count: String,
                  completion: @escaping () -> Void) {
        networkManager.getUsers(page: page,
                                count: count) { [weak self] result in
            defer { completion() }
            guard let self = self else { return }
            switch result {
            case .success(let success):
                handleUsers(users: success)
            case .failure(let error):
                if error == .noInternetConnection {
                    hasConnectError = true
                } else {
                    self.hasError = true
                }
            }
        }
    }
    
    private func handleUsers(users: UsersModel) {
        if allUsers.isEmpty {
            maximumPage = users.total_pages
        }
        
        let sortedNewUsers = users.users.sorted {
            $0.registration_timestamp > $1.registration_timestamp
        }
        
        self.allUsers.append(contentsOf: sortedNewUsers)
        
        self.currentPage += 1
    }
}
// MARK: - Coordinator
extension UsersViewModel {
    func goBack() {
        coordinator?.goBack()
    }
}
//MARK: - DataSource
extension UsersViewModel {
    func numberOfItems() -> Int {
        allUsers.count
    }
    
    func setUserDetails(at indexPath: IndexPath) -> UserDetails {
        let users = allUsers[indexPath.item]
        
        return UserDetails(userImage: users.phone,
                           name: users.name,
                           position: users.position,
                           email: users.email,
                           phone: users.phone)
    }
}
