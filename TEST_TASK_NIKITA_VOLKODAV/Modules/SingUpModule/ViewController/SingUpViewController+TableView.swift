import UIKit
//MARK: - UITableViewDataSource
extension SingUpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: PositionCell.reuseIdentifier,
                                 for: indexPath) as? PositionCell else {
            return UITableViewCell()
        }
        let positions = viewModel.setPositionDetails(at: indexPath)
        cell.setPositions(positions: positions)
        return cell
    }
}
//MARK: - UITableViewDelegate
extension SingUpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectPosition(at: indexPath)
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
}
