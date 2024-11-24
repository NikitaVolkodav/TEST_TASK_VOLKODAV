import UIKit

final class CustomTextFieldView: BaseInitView {
    
    private let textField = UITextField()
    private let infoLabel = UILabel()
    
    override func setView() {
//        backgroundColor = .red
    }
    
    override func addSubviews() {
        addSubview(textField)
        addSubview(infoLabel)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setupTextField(placeholder: String, infoText: String = "") {
        textField.placeholder = placeholder
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray
        ]

        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        infoLabel.text = infoText
    }
}
//MARK: - setupConfiguration
private extension CustomTextFieldView {
    func setupViewsConfiguration() {
        configTextField()
        configInfoLabel()
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
        infoLabel.text = "+38 (XXX) XXX - XX - XX"
        infoLabel.font = .regular14
        infoLabel.textColor = .gray
    }
}
//MARK: - setupConstraints
private extension CustomTextFieldView {
    func setupViewsConstraints() {
        setupTextFieldConstraints()
        setupInfoLabelConstraints()
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
}
