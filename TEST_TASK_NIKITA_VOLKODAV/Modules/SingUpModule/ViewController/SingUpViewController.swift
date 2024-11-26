import UIKit

final class SingUpViewController: BaseTabViewController {
    
    private let contentView = SingUpContentView()
    let viewModel = SingUpViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtons()
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
