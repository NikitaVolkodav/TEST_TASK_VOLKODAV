import UIKit

final class SingUpViewController: BaseTabViewController {
    
    private let contentView = SingUpContentView()
    let viewModel = SingUpViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

@available(iOS 17, *)
#Preview {
    let view = SingUpViewController()
    return view
}
