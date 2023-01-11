import Foundation

class PokeRepositoryImpl: PokeRepository {
    
    private let networking: PokeNetworking
    
    required init(networking: PokeNetworking) {
        self.networking = networking
    }
    
    func fetchCompactModels() -> [PokemonCompactModel] {
        return networking.fetchCompactModels()
    }
    
    func fetchFullModel(of model: PokemonCompactModel) -> PokemonFullModel {
        return networking.fetchFullModel(of: model)
    }
}
