import UIKit

final class LoadingCell: BaseTableViewCell {
    static let reuseIdentifier = "LoadingCell"
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func setCell() {
        selectionStyle = .none
    }
    
    override func addSubviews() {
        addSubview(activityIndicator)
    }
    
    override func setupConfiguration() {
        setupCellConfiguration()
    }
    
    override func setupConstraints() {
        setupCellsConstraints()
    }
    //MARK: - OpenActions
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}
// MARK: - setupConfiguration
private extension LoadingCell {
    func setupCellConfiguration() {
    }
}
// MARK: - setupConstraints
private extension LoadingCell {
    func setupCellsConstraints() {
        setupActivityIndicatorConstraints()
    }
    
    func setupActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
