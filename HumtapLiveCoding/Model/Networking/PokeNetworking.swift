import Foundation

protocol PokeNetworking {
    
    func fetchCompactModels() -> [PokemonCompactModel]
    func fetchFullModel(of model: PokemonCompactModel) -> PokemonFullModel
}
