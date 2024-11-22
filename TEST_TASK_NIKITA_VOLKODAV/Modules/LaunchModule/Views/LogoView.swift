import UIKit

final class LogoView: BaseInitView {
    
    private let logoImageView = UIImageView(image: .cat)
    private let appTitleLabel = UILabel()
    
    override func addSubviews() {
        addSubview(logoImageView)
        addSubview(appTitleLabel)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
}
//MARK: - setupConfiguration
private extension LogoView {
    func setupViewsConfiguration() {
        configAppTitleLabel()
    }
    
    func configAppTitleLabel() {
        appTitleLabel.text = TextContainer.LaunchScreen.appTitle
        appTitleLabel.font = .systemFont(ofSize: 28)
        appTitleLabel.textAlignment = .center
        appTitleLabel.textColor = .black
    }
}
//MARK: - setupConstraints
private extension LogoView {
    func setupViewsConstraints() {
        setupLogoImageViewConstraints()
        setupAppTitleLabelConstraints()
    }
    
    func setupLogoImageViewConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    func setupAppTitleLabelConstraints() {
        appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 12),
            appTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
}
