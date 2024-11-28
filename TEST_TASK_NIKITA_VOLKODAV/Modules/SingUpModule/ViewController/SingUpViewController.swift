import UIKit

final class SingUpViewController: BaseTabViewController {
    
    private let contentView = SingUpContentView()
    let viewModel = SingUpViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        configButtons()
        setupPositionTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectInitialPosition()
    }
    
    func startLoading() {
        viewModel.loadPositions()
        viewModel.$isLoading.bind { [weak self] isLoading in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.reloadTableView()
            }
        }
    }
    
    private func selectInitialPosition() {
        let initialPosition = viewModel.selectedItemIndex
        contentView.selectPosition(at: initialPosition)
    }
    
    private func setupPositionTableView() {
        contentView.setTableView(dataSource: self,
                                 delegate: self)
    }
}
//MARK: - configButtons
private extension SingUpViewController {
    func configButtons() {
        setupUploadButton()
    }
    
    func setupUploadButton() {
        contentView.setUploadAction { [weak self] in
            guard let self = self else { return }
            viewModel.showChoosePhotoAler(on: self)
        }
    }
}

@available(iOS 17, *)
#Preview {
    let view = SingUpViewController()
    return view
}
