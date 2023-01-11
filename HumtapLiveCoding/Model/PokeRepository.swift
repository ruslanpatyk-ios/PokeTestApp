import Foundation

protocol PokeRepository {
    
    func fetchCompactModels() -> [PokemonCompactModel]
    func fetchFullModel(of model: PokemonCompactModel) -> PokemonFullModel
    
    init(networking: PokeNetworking)
}
