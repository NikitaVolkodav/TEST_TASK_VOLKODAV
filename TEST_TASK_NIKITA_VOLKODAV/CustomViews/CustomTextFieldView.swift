import UIKit

final class CustomTextFieldView: BaseInitView {
    
    private let textField = UITextField()
    private let infoLabel = UILabel()
    private let uploadButton = UIButton()
    
    var uploadAction: (() -> Void)?
    
    override func addSubviews() {
        addSubview(textField)
        addSubview(infoLabel)
        addSubview(uploadButton)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setupTextField(placeholder: String,
                        infoText: String = "",
                        isHiddenUpload: Bool = true) {
        textField.placeholder = placeholder
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray
        ]
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        infoLabel.text = infoText
        uploadButton.isHidden = isHiddenUpload
    }
}
//MARK: - setupConfiguration
private extension CustomTextFieldView {
    func setupViewsConfiguration() {
        configTextField()
        configInfoLabel()
        configUploadButton()
    }
    
    func configTextField() {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.textColor = .black
        
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configInfoLabel() {
        infoLabel.font = .regular14
        infoLabel.textColor = .gray
    }
    
    func configUploadButton() {
        uploadButton.setTitle(TextContainer.SingUpScreen.upload, for: .normal)
        uploadButton.setTitleColor(.customBlue, for: .normal)
        uploadButton.titleLabel?.font = .regular18
        let action = UIAction { [weak self] _ in
            self?.uploadAction?()
        }
        uploadButton.addAction(action, for: .touchUpInside)
    }
}
//MARK: - setupConstraints
private extension CustomTextFieldView {
    func setupViewsConstraints() {
        setupTextFieldConstraints()
        setupInfoLabelConstraints()
        setupUploadButtonConstraints()
    }
    
    func setupTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupInfoLabelConstraints() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            infoLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 16)
        ])
    }
    
    func setupUploadButtonConstraints() {
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uploadButton.topAnchor.constraint(equalTo: textField.topAnchor,
                                              constant: 8),
            uploadButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor,
                                                   constant: -8),
            uploadButton.bottomAnchor.constraint(equalTo: textField.bottomAnchor,
                                                 constant: -8),
            uploadButton.widthAnchor.constraint(equalToConstant: 86)
        ])
    }
}
