import UIKit

final class UserCell: BaseTableViewCell {
    static let reuseIdentifier = "UserCell"
    
    private let userImageView = UIImageView()
    private let stackView = UIStackView()
    private let nameLabel = UILabel()
    private let positionLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let customLineView = UIView()
    
    override func setCell() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    override func addSubviews() {
        addSubview(userImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(positionLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        addSubview(customLineView)
    }
    
    override func setupConfiguration() {
        setupCellConfiguration()
    }
    
    override func setupConstraints() {
        setupCellsConstraints()
    }
    //MARK: - OpenActions
    func setUserCell(userImage: UIImage?,
                     name: String?,
                     position: String,
                     email: String,
                     phone: String) {
        userImageView.image = userImage
        nameLabel.text = name
        positionLabel.text = position
        emailLabel.text = email
        phoneLabel.text = phone
    }
}
// MARK: - setupConfiguration
private extension UserCell {
    func setupCellConfiguration() {
        configUserImageView()
        configStackView()
        configNameLabel()
        configPositionLabel()
        configEmailLabel()
        configPhoneLabel()
        configLineView()
    }
    
    func configUserImageView() {
        userImageView.image = .mokUser
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius = 25
        userImageView.layer.masksToBounds = true
    }
    
    func configStackView() {
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    func configNameLabel() {
        nameLabel.font = .regular18
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
    }
    
    func configPositionLabel() {
        positionLabel.textColor = .gray
        positionLabel.font = .regular14
    }
    
    func configEmailLabel() {
        emailLabel.textColor = .black
        emailLabel.font = .regular14
    }
    
    func configPhoneLabel() {
        phoneLabel.textColor = .black
        phoneLabel.font = .regular14
    }
    
    func configLineView() {
        customLineView.backgroundColor = .lightGray
    }
}
// MARK: - setupConstraints
private extension UserCell {
    func setupCellsConstraints() {
        setupUserImageViewConstraints()
        setupStackViewConstraints()
        setupCustomLineViewConstraints()
    }
    
    func setupUserImageViewConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
    
    func setupCustomLineViewConstraints() {
        customLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            customLineView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            customLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            customLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
