import UIKit
import Combine

class PokeListViewController: UIViewController {
    
    private let viewModel: PokeListViewModel
    
    private var mainView: PokeListMainView {
        return view as! PokeListMainView
    }
    
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: PokeListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        observeViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = PokeListMainView(viewModel: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.willAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        mainView.willDisappear()
    }
    
    private func observeViewModel() {
        viewModel
            .$title
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] title in
                self?.navigationItem.title = title
            })
            .store(in: &bag)
    }
}
