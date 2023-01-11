import Foundation
import UIKit


class PokeListViewController: UIViewController {
    
    private let viewModel: PokeListViewModel
    
    init(viewModel: PokeListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = PokeListMainView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
