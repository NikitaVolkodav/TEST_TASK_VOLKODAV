import UIKit

final class PositionCell: BaseTableViewCell {
    static let reuseIdentifier = "PositionCell"
    
    private let selectImageView = UIImageView()
    private let positionLabel = UILabel()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectButton(isSelected: selected)
    }
    
    override func setCell() {
        selectionStyle = .none
    }
    
    override func addSubviews() {
        addSubview(selectImageView)
        addSubview(positionLabel)
    }
    
    override func setupConfiguration() {
        setupCellConfiguration()
    }
    
    override func setupConstraints() {
        setupCellsConstraints()
    }
    //MARK: - OpenActions
    func setPositions(positions: String) {
        positionLabel.text = positions
    }
    
    func selectButton(isSelected: Bool = false) {
        let image: UIImage = isSelected ? .ellipseSelect : .ellipse
        selectImageView.image = image
    }
}
// MARK: - setupConfiguration
private extension PositionCell {
    func setupCellConfiguration() {
        configPositionLabel()
        configImageView()
    }
    
    func configPositionLabel() {
        positionLabel.textColor = .black
        positionLabel.font = .regular16
    }
    
    func configImageView() {
        selectImageView.contentMode = .scaleAspectFit
        selectImageView.image = .ellipse
    }
    
}
// MARK: - setupConstraints
private extension PositionCell {
    func setupCellsConstraints() {
        setupButtonConstraints()
        setupPositionLabelConstraints()
    }
    
    func setupButtonConstraints() {
        selectImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            selectImageView.heightAnchor.constraint(equalToConstant: 14),
            selectImageView.widthAnchor.constraint(equalToConstant: 14),
            selectImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupPositionLabelConstraints() {
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positionLabel.leadingAnchor.constraint(equalTo: selectImageView.trailingAnchor, constant: 25),
            positionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            positionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
