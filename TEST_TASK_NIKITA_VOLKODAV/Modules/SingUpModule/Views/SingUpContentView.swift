import UIKit

final class SingUpContentView: BaseInitView {
    
    private let navigationView = NavigationView()
    private let nameTextField = CustomTextFieldView()
    private let emailTextField = CustomTextFieldView()
    private let phoneTextField = CustomTextFieldView()
    private let selectPositionLabel = UILabel()
    private let newTESTLabel = UILabel()
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(navigationView)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(phoneTextField)
        addSubview(selectPositionLabel)
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
        configTextFields()
        configSelectPositionLabel()
    }
    
    func configNavigationView() {
        navigationView.setTitle(by: .post)
    }
    
    func configTextFields() {
        nameTextField.setupTextField(placeholder: "Your name")
        emailTextField.setupTextField(placeholder: "Email")
        phoneTextField.setupTextField(placeholder: "Phone", infoText: "+38 (XXX) XXX - XX - XX")
    }
    
    func configSelectPositionLabel() {
        selectPositionLabel.text = "Select your position"
    }
}
//MARK: - setupConstraints
private extension SingUpContentView {
    func setupViewsConstraints() {
        setupNavigationViewConstraints()
        setupNameTextFieldConstraints()
        setupEmailTextFieldConstraints()
        setupPhoneTextFieldConstraints()
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
    
    func setupNameTextFieldConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 22),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    func setupEmailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    func setupPhoneTextFieldConstraints() {
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12),
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            phoneTextField.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
}

