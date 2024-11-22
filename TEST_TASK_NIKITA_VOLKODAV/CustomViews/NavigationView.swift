import UIKit

final class NavigationView: BaseInitView {
    
    private let titleLabel = UILabel()
    
    override func setView() {
        backgroundColor = .customYellow
    }
    
    override func addSubviews() {
        addSubview(titleLabel)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setTitle(by status: NavigationStatus) {
        switch status {
        case .get:
            titleLabel.text = TextContainer.UsersScreen.navTitle
        case .post:
            titleLabel.text = TextContainer.SingUpScreen.navTitle
        }
    }
}
//MARK: - setupConfiguration
private extension NavigationView {
    func setupViewsConfiguration() {
        configTitleLabel()
    }
    
    func configTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = .regular20
    }
}
//MARK: - setupConstraints
private extension NavigationView {
    func setupViewsConstraints() {
        setupTitleLabelConstraints()
    }
    
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
