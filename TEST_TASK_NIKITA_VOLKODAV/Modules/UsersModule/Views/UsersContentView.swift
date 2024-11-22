import UIKit

final class UsersContentView: BaseInitView {
    
    private let navigationView = NavigationView()
    private let infoView = InfoView()
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(navigationView)
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
            infoView.isHidden = false
        case .internet:
            navigationView.isHidden = true
            infoView.isHidden = false
        case .registered:
            break
        case .email:
            break
        }
    }
}
//MARK: - setupConfiguration
private extension UsersContentView {
    func setupViewsConfiguration() {
        configNavigationView()
        configInfoView()
    }
    
    func configNavigationView() {
        navigationView.setTitle(by: .get)
    }
    
    func configInfoView() {
        infoView.isHidden = true
    }
}
//MARK: - setupConstraints
private extension UsersContentView {
    func setupViewsConstraints() {
        setupNavigationViewConstraints()
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
    
    func setupInfoViewConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
