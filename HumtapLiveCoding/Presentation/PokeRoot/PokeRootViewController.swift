import UIKit
import Combine

class PokeRootViewController: UINavigationController {
    
    private let viewModel: PokeRootViewModel
    private let pokeListFactory: PokeListViewControllerFactory
    private let pokeDetailsFactory: PokeDetailsViewControllerFactory
    
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: PokeRootViewModel,
         pokeListFactory: PokeListViewControllerFactory,
         pokeDetailsFactory: PokeDetailsViewControllerFactory) {
        self.viewModel = viewModel
        self.pokeListFactory = pokeListFactory
        self.pokeDetailsFactory = pokeDetailsFactory
        
        super.init(nibName: nil, bundle: nil)
        
        observeViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func observeViewModel() {
        viewModel
            .$view
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] view in
                self?.show(view: view)
            })
            .store(in: &bag)
    }
    
    private func show(view: PokeRootViewModel.View) {
        switch view {
            
        case .list:
            if presentedViewController != nil {
                dismiss(animated: true)
            }
            
            let viewController = viewControllers.first ?? pokeListFactory.makePokeListViewController()
            
            setViewControllers([viewController], animated: true)
        case .details(let model):
            present(pokeDetailsFactory.makePokeDetailsViewController(pokeModel: model), animated: true)
        }
    }
}
