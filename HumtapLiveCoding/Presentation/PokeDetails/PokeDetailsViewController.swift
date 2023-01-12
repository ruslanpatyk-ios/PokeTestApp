import UIKit

class PokeDetailsViewController: UIViewController {
    
    private let viewModel: PokeDetailsViewModel
    
    private var mainView: PokeDetailsMainView {
        return view as! PokeDetailsMainView
    }
    
    init(viewModel: PokeDetailsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = PokeDetailsMainView(viewModel: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.willAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        mainView.willDisappear()
    }
}
