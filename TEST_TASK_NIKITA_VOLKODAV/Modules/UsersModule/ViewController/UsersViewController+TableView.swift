import UIKit
//MARK: UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier,
                                 for: indexPath) as? UserCell else { return UITableViewCell() }
        let users = viewModel.setUserDetails(at: indexPath)
        cell.setUserCell(userImage: users.userImage,
                         name: users.name,
                         position: users.position,
                         email: users.email,
                         phone: users.phone)
        return cell
    }
}
//MARK: UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
