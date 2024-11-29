import UIKit

final class SingUpContentView: BaseInitView {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let navigationView = NavigationView()
    private let nameTextField = CustomTextFieldView()
    private let emailTextField = CustomTextFieldView()
    private let phoneTextField = CustomTextFieldView()
    private let photoTextField = CustomTextFieldView()
    private let selectPositionLabel = UILabel()
    private let positionTableView = UITableView()
    private let signUpButton = UIButton()
    
    var signUpAction: (() -> Void)?
    
    override func setView() {
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(navigationView)
        contentView.addSubview(nameTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(selectPositionLabel)
        contentView.addSubview(positionTableView)
        contentView.addSubview(photoTextField)
        contentView.addSubview(signUpButton)
    }
    
    override func setupConfiguration() {
        setupViewsConfiguration()
    }
    
    override func setupConstraints() {
        setupViewsConstraints()
    }
    
    //MARK: - OpenActions
    func setUploadAction(_ action: (() -> Void)?) {
        photoTextField.uploadAction = action
    }
    
    func enableSignUpButton(isEnabled: Bool) {
        signUpButton.isUserInteractionEnabled = isEnabled
        if isEnabled {
            signUpButton.backgroundColor = .customYellow
            signUpButton.setTitleColor(.black, for: .normal)
        } else {
            signUpButton.backgroundColor = .lightGray
            signUpButton.setTitleColor(.darkGray, for: .normal)
        }
    }
    
    func reloadTableView() {
        positionTableView.reloadData()
    }
    
    func setTableView(dataSource: UITableViewDataSource,
                      delegate: UITableViewDelegate) {
        positionTableView.dataSource = dataSource
        positionTableView.delegate = delegate
    }
    
    func selectPosition(at indexPath: IndexPath) {
        positionTableView.selectRow(at: indexPath,
                                    animated: true,
                                    scrollPosition: .none)
    }
    
    func getNameTextField() -> UITextField {
        nameTextField.getTextField()
    }
    
    func getEmaiTextField() -> UITextField {
        emailTextField.getTextField()
    }
    
    func getPhoneTextField() -> UITextField {
        phoneTextField.getTextField()
    }
    
    func getPhotoTextField() -> UITextField {
        photoTextField.getTextField()
    }
    
    func setTextFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.setTextFieldDelegate(delegate: delegate)
        emailTextField.setTextFieldDelegate(delegate: delegate)
        phoneTextField.setTextFieldDelegate(delegate: delegate)
        photoTextField.setTextFieldDelegate(delegate: delegate)
    }
    
    func setNameInvalidText(placeholder: String, infoText: String) {
        nameTextField.invalidText(placeholder: placeholder, infoText: infoText)
    }
    
    func setEmailInvalidText(placeholder: String, infoText: String) {
        emailTextField.invalidText(placeholder: placeholder, infoText: infoText)
    }
    
    func setPhoneInvalidText(placeholder: String, infoText: String) {
        phoneTextField.invalidText(placeholder: placeholder, infoText: infoText)
    }
    
    func setPhotoInvalidText(placeholder: String, infoText: String) {
        photoTextField.invalidText(placeholder: placeholder, infoText: infoText)
    }
    
    func setDefaultNameTextField() {
        nameTextField.setupTextField(placeholder: TextContainer.SingUpScreen.name)
    }
    
    func setDefaultEmailTextField() {
        emailTextField.setupTextField(placeholder: TextContainer.SingUpScreen.email)
    }
    
    func setDefaultPhoneTextField() {
        phoneTextField.setupTextField(placeholder: TextContainer.SingUpScreen.phone,
                                      infoText: TextContainer.SingUpScreen.phoneMask)
    }
    
    func setDefaultPhotoTextField() {
        photoTextField.setupTextField(placeholder: TextContainer.SingUpScreen.photo,
                                      isHiddenUpload: false)
    }
    
    func getTextFieldTexts() -> (name: String,
                                 email: String,
                                 phone: String,
                                 photo: String) {
        return (name: nameTextField.getTextFieldText(),
                email: emailTextField.getTextFieldText(),
                phone: phoneTextField.getTextFieldText(),
                photo: photoTextField.getTextFieldText())
    }
    
    func setPhotoTextField(name: String) {
        photoTextField.setTextFieldText(text: name)
    }
}
//MARK: - setupConfiguration
private extension SingUpContentView {
    func setupViewsConfiguration() {
        configNavigationView()
        configTextFields()
        configSelectPositionLabel()
        configPositionTableView()
        configSignUpButton()
        configTapGestureToDismissKeyboard()
    }
    
    func configNavigationView() {
        navigationView.setTitle(by: .post)
    }
    
    func configTextFields() {
        nameTextField.setupTextField(placeholder: TextContainer.SingUpScreen.name)
        emailTextField.setupTextField(placeholder: TextContainer.SingUpScreen.email)
        phoneTextField.setupTextField(placeholder: TextContainer.SingUpScreen.phone,
                                      infoText: TextContainer.SingUpScreen.phoneMask)
        photoTextField.setupTextField(placeholder: TextContainer.SingUpScreen.photo,
                                      isHiddenUpload: false)
        photoTextField.isUserEnabled(bool: false)
        photoTextField.setRightView()
    }
    
    func configSelectPositionLabel() {
        selectPositionLabel.text = TextContainer.SingUpScreen.selectPosition
        selectPositionLabel.font = .regular18
    }
    
    func configPositionTableView() {
        positionTableView.register(PositionCell.self,
                                   forCellReuseIdentifier: PositionCell.reuseIdentifier)
        positionTableView.backgroundColor = .white
        positionTableView.separatorStyle = .none

    }
    
    func configSignUpButton() {
        signUpButton.backgroundColor = .lightGray
        signUpButton.layer.cornerRadius = 24
        signUpButton.setTitle(TextContainer.SingUpScreen.signUp,
                              for: .normal)
        signUpButton.setTitleColor(.darkGray, for: .normal)
        signUpButton.isUserInteractionEnabled = false
        updateAction()
    }
    
    func updateAction() {
        let action = UIAction { [weak self] _ in
            self?.signUpAction?()
        }
        signUpButton.addAction(action, for: .touchUpInside)
    }
    
    func configTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        endEditing(true)
    }
}
//MARK: - setupConstraints
private extension SingUpContentView {
    func setupViewsConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupNavigationViewConstraints()
        setupNameTextFieldConstraints()
        setupEmailTextFieldConstraints()
        setupPhoneTextFieldConstraints()
        setupSelectPositionLabelConstraints()
        setupPositionTableViewConstraints()
        stupPhotoTextFieldConstraints()
        setupSignUpButtonConstraints()
        setupSignUpButtonConstraints()
    }
    
    func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupNavigationViewConstraints() {
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: contentView.topAnchor),
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
    
    func setupSelectPositionLabelConstraints() {
        selectPositionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectPositionLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor,
                                                     constant: 24),
            selectPositionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                         constant: 16),
            selectPositionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: -16),
        ])
    }
    
    func setupPositionTableViewConstraints() {
        positionTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positionTableView.topAnchor.constraint(equalTo: selectPositionLabel.bottomAnchor, constant: 12),
            positionTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            positionTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            positionTableView.heightAnchor.constraint(equalToConstant: 192)
        ])
    }
    
    func stupPhotoTextFieldConstraints() {
        photoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoTextField.topAnchor.constraint(equalTo: positionTableView.bottomAnchor, constant: 28),
            photoTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            photoTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            photoTextField.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    func setupSignUpButtonConstraints() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: photoTextField.bottomAnchor,
                                              constant: 24),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.widthAnchor.constraint(equalToConstant: 140),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
