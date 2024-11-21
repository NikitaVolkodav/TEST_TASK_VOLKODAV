import UIKit

final class LaunchContentView: BaseInitView {
    
    private let logoView = LogoView()
    
    override func setView() {
        backgroundColor = .customYellow
    }
    
    override func addSubviews() {
        addSubview(logoView)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
}
//MARK: - setupConfiguration
private extension LaunchContentView {
    func setupViewsConfiguration() {
    }
}
//MARK: - setupConstraints
private extension LaunchContentView {
    func setupViewsConstraints() {
        setupLogoViewConstraints()
    }
    
    func setupLogoViewConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}
