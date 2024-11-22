import UIKit

final class UsersViewController: BaseTabViewController {
    
    private let contentView = UsersContentView()
    let viewModel = UsersViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

@available(iOS 17, *)
#Preview {
    let view = UsersViewController()
    return view
}
