import Foundation

protocol PokeDetailsViewControllerFactory {
    func makePokeDetailsViewController(pokeModel: PokeModel) -> PokeDetailsViewController
}
