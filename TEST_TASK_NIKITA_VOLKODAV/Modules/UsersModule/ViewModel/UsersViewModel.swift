import Foundation

final class UsersViewModel {
    private let networkManager: NetworkGettable = NetworkManager()
    private var usersModel: UsersModel?
    private var allUsers: [User] = []
    weak var coordinator: UsersCoordinator?
    
    @ObservableValue var isLoading: Bool = false
    @ObservableValue var hasError: Bool = false
    
    
    private var currentPage: Int = 1
    private var isLoadingMore: Bool = false
    private var hasMorePages: Bool = true
    
//    func loadUsers() {
//        isLoading = true
////        hasError = false
//        getUsers(page: "7", count: "6") { [weak self] in
//            guard let self = self else { return }
//            isLoading = false
//        }
//    }
    
    func loadUsers() {
        guard !isLoadingMore,
              hasMorePages else { return }
        
        isLoadingMore = true
        isLoading = true
        
        getUsers(page: "\(currentPage)",
                 count: "6") { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
            self.isLoadingMore = false
        }
    }
}
//MARK: - Network
extension UsersViewModel {
    private func getUsers(page: String,
                          count: String,
                          completion: @escaping () -> Void) {
        networkManager.getUsers(page: page,
                                count: count) { [weak self] result in
            defer { completion() }
            guard let self = self else { return }
            switch result {
            case .success(let success):
                print(usersModel)
                handleUsers(users: success)
            case .failure(let error):
                print(error)
//                self.hasError = true
            }
        }
    }
    
//    private func handleUsers(users: UsersModel) {
//        self.usersModel = users
//        
//    }
    
    private func handleUsers(users: UsersModel) {
        self.currentPage = users.page
        self.hasMorePages = !users.links.next_url.isEmpty
        
        let sortedUsers = users.users.sorted { $0.registration_timestamp > $1.registration_timestamp }
        self.allUsers.append(contentsOf: sortedUsers)
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
//        usersModel?.count ?? 0
        allUsers.count
    }
    
//    func setUserDetails(at indexPath: IndexPath) -> UserDetails {
//        guard let users = usersModel?.users[indexPath.item] else {
//            return UserDetails.default
//        }
//        
//        return UserDetails(userImage: users.phone,
//                           name: users.name,
//                           position: users.position,
//                           email: users.email,
//                           phone: users.phone)
//    }
    
    func setUserDetails(at indexPath: IndexPath) -> UserDetails {
        let users = allUsers[indexPath.item]
        
        return UserDetails(userImage: users.phone,
                           name: users.name,
                           position: users.position,
                           email: users.email,
                           phone: users.phone)
    }
}
