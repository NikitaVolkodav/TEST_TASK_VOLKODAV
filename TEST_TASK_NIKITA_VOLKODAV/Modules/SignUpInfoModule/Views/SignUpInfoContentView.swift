import UIKit

final class SignUpInfoContentView: BaseInitView {
    
    private let backButton = UIButton()
    private let infoView = InfoView()
    
    var backAction: (() -> Void)?
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(backButton)
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
    }
    
    func setGotItButton(_ action: (() -> Void)?) {
        infoView.buttonAction = action
    }
    
    func setTryAgainButton(_ action: (() -> Void)?) {
        infoView.buttonAction = action
    }
}
//MARK: - setupConfiguration
private extension SignUpInfoContentView {
    func setupViewsConfiguration() {
        configBacButton()
    }
    
    func configBacButton() {
        if let backImage = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal) {
            let tintedImage = backImage.withTintColor(.gray)
            backButton.setImage(tintedImage, for: .normal)
        }
        let action = UIAction { [weak self] _ in
            self?.backAction?()
        }
        backButton.addAction(action, for: .touchUpInside)
    }
}
//MARK: - setupConstraints
private extension SignUpInfoContentView {
    func setupViewsConstraints() {
        setupBackButtonConstraints()
        setuoInfoViewConstraints()
    }
    
    func setupBackButtonConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                            constant: 24),
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -24),
            backButton.widthAnchor.constraint(equalToConstant: 48),
            backButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setuoInfoViewConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoView.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 320),
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
