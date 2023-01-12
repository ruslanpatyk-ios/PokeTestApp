import Foundation

class RepositoryProvider {
    
    static let shared = RepositoryProvider()
    
    let pokeRepositry: PokeRepository = PokeRepositoryImpl(networker: Networker())
}
