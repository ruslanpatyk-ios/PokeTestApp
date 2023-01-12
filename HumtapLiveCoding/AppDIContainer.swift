import Foundation
import UIKit

class AppDIContainer {
    
    private let pokeRootViewModel = PokeRootViewModel()
    
    private var pokeRepository: PokeRepository {
        RepositoryProvider.shared.pokeRepositry
    }
}

extension AppDIContainer: PokeRootViewControllerFactory {
    
    func makePokeRootViewController() -> PokeRootViewController {
        let viewController = PokeRootViewController(viewModel: pokeRootViewModel,
                                                    pokeListFactory: self,
                                                    pokeDetailsFactory: self)
        return viewController
    }
}

extension AppDIContainer: PokeListViewControllerFactory {
    
    func makePokeListViewController() -> PokeListViewController {
        let viewModel = PokeListViewModel(repository: pokeRepository, responder: pokeRootViewModel)
        let viewController = PokeListViewController(viewModel: viewModel)
        return viewController
    }
}

extension AppDIContainer: PokeDetailsViewControllerFactory {
    
    func makePokeDetailsViewController(pokeModel: PokeModel) -> PokeDetailsViewController {
        let viewModel = PokeDetailsViewModel(pokeModel: pokeModel, responder: pokeRootViewModel)
        let viewController = PokeDetailsViewController(viewModel: viewModel)
        return viewController
    }
}
