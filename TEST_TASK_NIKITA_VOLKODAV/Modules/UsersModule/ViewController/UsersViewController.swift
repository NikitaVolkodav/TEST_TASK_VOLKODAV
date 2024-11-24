import UIKit

final class UsersViewController: BaseTabViewController {
    
    private let contentView = UsersContentView()
    let viewModel = UsersViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configInfoView()
    }
    
    private func setupTableView() {
        contentView.setTableView(dataSource: self,
                                 delegate: self)
    }
    
    private func configInfoView() {
        contentView.setInfoView(by: .registered)
    }
}
