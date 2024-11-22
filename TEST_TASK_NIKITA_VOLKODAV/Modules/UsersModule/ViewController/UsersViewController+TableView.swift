import UIKit
//MARK: UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier,
                                 for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.setUserCell(userImage: .mokUser,
                         name: "Malcolm Bailey",
                         position: "Frontend developer",
                         email: "jany_murazik51@hotmail.com",
                         phone: "+38 (098) 278 76 24")
        return cell
    }
}
//MARK: UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
