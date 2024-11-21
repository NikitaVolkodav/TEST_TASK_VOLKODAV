import UIKit

final class LaunchViewController: UIViewController {
    
    private let contentView = LaunchContentView()
    let viewModel = LaunchViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.startTimer()
    }
}

@available(iOS 17, *)
#Preview {
    let view = LaunchViewController()
    return view
}
