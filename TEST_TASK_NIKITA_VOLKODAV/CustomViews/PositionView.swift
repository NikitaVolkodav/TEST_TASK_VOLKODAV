import UIKit

final class PositionView: BaseInitView {
    
    private let button = UIButton()
    private let positionLabel = UILabel()
    
    var onSelect: (() -> Void)?
    
    override func addSubviews() {
        addSubview(button)
        addSubview(positionLabel)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setPosition(type: PositionType,
                     isSelected: Bool = false) {
        switch type {
        case .frontend:
            positionLabel.text = TextContainer.SingUpScreen.front
        case .backend:
            positionLabel.text = TextContainer.SingUpScreen.back
        case .designer:
            positionLabel.text = TextContainer.SingUpScreen.designer
        case .qa:
            positionLabel.text = TextContainer.SingUpScreen.qa
        }
        selectButton(isSelected: isSelected)
    }
    
    func selectButton(isSelected: Bool = false) {
        let image: UIImage = isSelected ? .ellipseSelect : .ellipse
        button.setImage(image, for: .normal)
    }
}
//MARK: - setupConfiguration
private extension PositionView {
    func setupViewsConfiguration() {
        configButton()
        configPositionLabel()
    }
    
    func configButton() {
        let action = UIAction { [weak self] _ in
            self?.onSelect?()
        }
        button.addAction(action, for: .touchUpInside)
    }
    
    func configPositionLabel() {
        positionLabel.textColor = .black
        positionLabel.font = .regular16
    }
}
//MARK: - setupConstraints
private extension PositionView {
    func setupViewsConstraints() {
        setupButtonConstraints()
        setupPositionLabelConstraints()
    }
    
    func setupButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupPositionLabelConstraints() {
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positionLabel.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 8),
            positionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            positionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
