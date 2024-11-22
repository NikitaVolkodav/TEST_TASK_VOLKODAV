import UIKit

final class InfoView: BaseInitView {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let actionButton = UIButton()
    
    var internetAction: (() -> Void)?
    var registeredAction: (() -> Void)?
    var emailAction: (() -> Void)?
    
    override func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(actionButton)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setInfoView(by status: InfoViewStatus) {
        switch status {
        case .empty:
            imageView.image = .empty
            titleLabel.text = TextContainer.Info.emptyTitle
            actionButton.isHidden = true
        case .internet:
            imageView.image = .internet
            titleLabel.text = TextContainer.Info.internetTitle
            actionButton.setTitle(TextContainer.Info.tryAgain, for: .normal)
        case .registered:
            imageView.image = .registered
            titleLabel.text = TextContainer.Info.registeredTitle
            actionButton.setTitle(TextContainer.Info.gotIt, for: .normal)
        case .email:
            imageView.image = .email
            titleLabel.text = TextContainer.Info.emailTitle
            actionButton.setTitle(TextContainer.Info.tryAgain, for: .normal)
        }
        updateAction(for: status)
    }
}
//MARK: - setupConfiguration
private extension InfoView {
    func setupViewsConfiguration() {
        configImageView()
        configTitleLabel()
        configActionButton()
    }
    
    func configImageView() {
        imageView.contentMode = .scaleAspectFit
    }
    
    func configTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = .regular20
    }
    
    func configActionButton() {
        actionButton.backgroundColor = .customYellow
        actionButton.layer.cornerRadius = 24
        actionButton.setTitleColor(.black, for: .normal)
        actionButton.titleLabel?.font = .semibold18
    }
    
    func updateAction(for actionType: InfoViewStatus) {
        actionButton.removeTarget(nil, action: nil, for: .allEvents)
        
        let action: UIAction
        switch actionType {
        case .internet:
            action = UIAction { [weak self] _ in
                self?.internetAction?()
            }
        case .registered:
            action = UIAction { [weak self] _ in
                self?.registeredAction?()
            }
        case .email:
            action = UIAction { [weak self] _ in
                self?.emailAction?()
            }
        case .empty:
            action = UIAction { _ in }
        }
        
        actionButton.addAction(action, for: .touchUpInside)
    }
}
//MARK: - setupConstraints
private extension InfoView {
    func setupViewsConstraints() {
        setupImageViewConstraints()
        setupTitleLabelConstraints()
        setupActionButtonConstraints()
    }
    
    func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24)
        ])
    }
    
    func setupActionButtonConstraints() {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 48),
            actionButton.widthAnchor.constraint(equalToConstant: 140),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
