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
    private let positionStackView = UIStackView()
    private let signUpButton = UIButton()
    private var selectedIndex: Int = 0
    private let positions: [PositionType] = [.frontend, .backend, .designer, .qa]
    
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
        contentView.addSubview(positionStackView)
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
    func getSelectedIndex() -> Int {
        return selectedIndex
    }
    
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
}
//MARK: - setupConfiguration
private extension SingUpContentView {
    func setupViewsConfiguration() {
        configNavigationView()
        configTextFields()
        configSelectPositionLabel()
        configPositionStackView()
        configSignUpButton()
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
    }
    
    func configSelectPositionLabel() {
        selectPositionLabel.text = TextContainer.SingUpScreen.selectPosition
        selectPositionLabel.font = .regular18
    }
    
    func configPositionStackView() {
        positionStackView.axis = .vertical
        positionStackView.spacing = 1
        positionStackView.alignment = .fill
        
        positions.enumerated().forEach { index, position in
            let positionView = createPositionView(for: position, at: index)
            positionStackView.addArrangedSubview(positionView)
        }
    }
    
    func createPositionView(for position: PositionType, at index: Int) -> PositionView {
        let positionView = PositionView()
        positionView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        positionView.setPosition(type: position, isSelected: index == selectedIndex)
        
        positionView.onSelect = { [weak self] in
            self?.handlePositionSelection(at: index, for: positionView)
        }
        return positionView
    }
    
    func handlePositionSelection(at index: Int, for positionView: PositionView) {
        if let currentView = positionStackView.arrangedSubviews[selectedIndex] as? PositionView {
            currentView.selectButton(isSelected: false)
        }
        
        selectedIndex = index
        positionView.selectButton(isSelected: true)
    }
    
    func configSignUpButton() {
        signUpButton.backgroundColor = .lightGray
        signUpButton.layer.cornerRadius = 24
        signUpButton.setTitle(TextContainer.SingUpScreen.signUp,
                              for: .normal)
        signUpButton.setTitleColor(.darkGray, for: .normal)
        signUpButton.isUserInteractionEnabled = false
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
        setupPositionStackViewConstraints()
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
    
    func setupPositionStackViewConstraints() {
        positionStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positionStackView.topAnchor.constraint(equalTo: selectPositionLabel.bottomAnchor, constant: 12),
            positionStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            positionStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func stupPhotoTextFieldConstraints() {
        photoTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoTextField.topAnchor.constraint(equalTo: positionStackView.bottomAnchor, constant: 28),
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
