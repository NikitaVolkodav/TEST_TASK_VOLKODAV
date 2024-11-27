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
        setupInternetAction()
        setupTableView()
    }
    
    func startLoading() {
        viewModel.loadUsers()
        viewModel.$isLoading.bind { [weak self] isLoading in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.reloadTableView()
            }
        }
        
        viewModel.$hasConnectError.bind { [weak self] hasError in
            guard let self else { return }
            DispatchQueue.main.async {
                if hasError {
                    self.contentView.setInfoView(by: .internet)
                }
            }
        }
        
        viewModel.$hasError.bind { [weak self] hasError in
            guard let self else { return }
            DispatchQueue.main.async {
                if hasError {
                    self.contentView.setInfoView(by: .empty)
                }
            }
        }
    }
    
    private func setupInternetAction() {
        contentView.setInternetAction { [weak self] in
            guard let self = self else { return }
            contentView.setDefaultUI()
            startLoading()
        }
    }
    
    private func setupTableView() {
        contentView.setTableView(dataSource: self,
                                 delegate: self)
    }
}

@available(iOS 17, *)
#Preview {
    let view = UsersViewController()
    return view
}
