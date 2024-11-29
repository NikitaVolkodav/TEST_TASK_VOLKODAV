import UIKit

final class SignUpInfoViewController: UIViewController {
    
    private let contentView = SignUpInfoContentView()
    let viewModel = SignUpInfoViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonActions()
        setInfoViewWithStatus()
    }
    
    private func setInfoViewWithStatus() {
        let status = viewModel.getStatus()
        contentView.setInfoView(by: status)
    }
}
//MARK: - setupButtonActions
private extension SignUpInfoViewController {
    func setupButtonActions() {
        setupBackButtonAction()
        setupGotItButtonAction()
        setupTryAgainButtonAction()
    }
    
    func setupBackButtonAction() {
        contentView.backAction = { [weak self] in
            guard let self = self else { return }
            viewModel.goBack()
        }
    }
    
    func setupGotItButtonAction() {
        contentView.setGotItButton { [weak self] in
            guard let self = self else { return }
            viewModel.goBack()
        }
    }
    
    func setupTryAgainButtonAction() {
        contentView.setTryAgainButton { [weak self] in
            guard let self = self else { return }
            viewModel.goBack()
        }
    }
}

@available(iOS 17, *)
#Preview {
    let view = SignUpInfoViewController()
    return view
}
