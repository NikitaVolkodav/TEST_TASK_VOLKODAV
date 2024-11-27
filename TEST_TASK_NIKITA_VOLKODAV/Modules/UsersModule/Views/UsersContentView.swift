import UIKit

final class UsersContentView: BaseInitView {
    
    private let navigationView = NavigationView()
    private let infoView = InfoView()
    private let tableView = UITableView()
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(navigationView)
        addSubview(tableView)
        addSubview(infoView)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setInfoView(by status: InfoViewStatus) {
        infoView.setInfoView(by: status)
        switch status {
        case .empty:
            tableView.isHidden = true
            infoView.isHidden = false
        case .internet:
            tableView.isHidden = true
            navigationView.isHidden = true
            infoView.isHidden = false
        case .registered:
            break
        case .email:
            break
        }
    }
    
    func setDefaultUI() {
        tableView.isHidden = false
        navigationView.isHidden = false
        infoView.isHidden = true
    }
    
    func setInternetAction(action: (() -> Void)?) {
        infoView.buttonAction = action
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func setTableView(dataSource: UITableViewDataSource,
                      delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}
//MARK: - setupConfiguration
private extension UsersContentView {
    func setupViewsConfiguration() {
        configNavigationView()
        configInfoView()
        configTableView()
    }
    
    func configNavigationView() {
        navigationView.setTitle(by: .get)
    }
    
    func configInfoView() {
        infoView.isHidden = true
    }
    
    func configTableView() {
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseIdentifier)
        tableView.register(LoadingCell.self, forCellReuseIdentifier: LoadingCell.reuseIdentifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
    }
}
//MARK: - setupConstraints
private extension UsersContentView {
    func setupViewsConstraints() {
        setupNavigationViewConstraints()
        setupTableViewConstraints()
        setupInfoViewConstraints()
    }
    
    func setupNavigationViewConstraints() {
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupInfoViewConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoView.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
}
