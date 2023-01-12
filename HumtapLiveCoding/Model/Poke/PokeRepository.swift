import Foundation

protocol PokeRepository {
    
    func fetch(completion: @escaping ([PokeModel]) -> Void)
}
