import UIKit

final class SingUpContentView: BaseInitView {
    
    private let navigationView = NavigationView()
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(navigationView)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
}
//MARK: - setupConfiguration
private extension SingUpContentView {
    func setupViewsConfiguration() {
        configNavigationView()
    }
    
    func configNavigationView() {
        navigationView.setTitle(by: .post)
    }
}
//MARK: - setupConstraints
private extension SingUpContentView {
    func setupViewsConstraints() {
        setupNavigationViewConstraints()
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
}
