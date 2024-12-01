import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeCell()
    }
    
    private func initializeCell() {
        setCell()
        addSubviews()
        setupConfiguration()
        setupConstraints()
    }
    
    func setCell() {}
    
    func addSubviews() {}
    
    func setupConfiguration() {}
    
    func setupConstraints() {}
}
