import UIKit

final class InfoView: BaseInitView {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let actionButton = UIButton()
    
    var buttonAction: (() -> Void)?
    
    override func setView() {
        backgroundColor = .white
    }
    
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
            actionButton.isHidden = false
            imageView.image = .internet
            titleLabel.text = TextContainer.Info.internetTitle
            actionButton.setTitle(TextContainer.Info.tryAgain, for: .normal)
        case .registered:
            actionButton.isHidden = false
            imageView.image = .registered
            titleLabel.text = TextContainer.Info.registeredTitle
            actionButton.setTitle(TextContainer.Info.gotIt, for: .normal)
        case .email:
            actionButton.isHidden = false
            imageView.image = .email
            titleLabel.text = TextContainer.Info.emailTitle
            actionButton.setTitle(TextContainer.Info.tryAgain, for: .normal)
        }
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
        updateAction()
    }
    
    private func updateAction() {
        actionButton.removeTarget(nil, action: nil, for: .allEvents)
        let action = UIAction { [weak self] _ in
            self?.buttonAction?()
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
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
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
