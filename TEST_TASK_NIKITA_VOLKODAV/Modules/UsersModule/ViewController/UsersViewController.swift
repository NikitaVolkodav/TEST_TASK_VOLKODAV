import UIKit

final class UsersViewController: BaseTabViewController {
    
    private let contentView = UsersContentView()
    let viewModel = UsersViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        setupTableView()
        configInfoView()
    }
    
    private func startLoading() {
        viewModel.loadUsers()
        viewModel.$isLoading.bind { [weak self] isLoading in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.reloadTableView()
            }
        }
    }
    
    private func setupTableView() {
        contentView.setTableView(dataSource: self,
                                 delegate: self)
    }
    
    private func configInfoView() {
        contentView.setInfoView(by: .registered)
    }
}

@available(iOS 17, *)
#Preview {
    let view = UsersViewController()
    return view
}
