import UIKit
//MARK: UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoadingCell(for: indexPath) {
            return createLoadingCell(for: tableView, at: indexPath)
        } else {
            return createUserCell(for: tableView, at: indexPath)
        }
    }
    
    // MARK: - Helper Methods
    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == viewModel.numberOfItems()
    }
    
    private func createLoadingCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let loadingCell = tableView
            .dequeueReusableCell(withIdentifier: LoadingCell.reuseIdentifier,
                                 for: indexPath) as? LoadingCell else {
            return UITableViewCell()
        }
        loadingCell.startAnimating()
        if viewModel.isLastPage {
            loadingCell.stopAnimating()
        }
        return loadingCell
    }
    
    private func createUserCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier, for: indexPath) as? UserCell else {
            return UITableViewCell()
        }
        
        let user = viewModel.setUserDetails(at: indexPath)
        cell.setUserCell(userImage: user.userImage,
                         name: user.name,
                         position: user.position,
                         email: user.email,
                         phone: user.phone)
        return cell
    }
}

//MARK: UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == viewModel.numberOfItems() ? 44 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
                self?.startLoading()
            }
        }
    }
}
