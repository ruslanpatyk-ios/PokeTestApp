import Foundation
import Combine

class PokeListViewModel {
    
    private let repository: PokeRepository
    
    @Published var items = [PokeItem]()
    
    init(repository: PokeRepository) {
        self.repository = repository
        
        items = repository
            .fetchCompactModels()
            .map { model in
                PokeItem(name: model.name, thumbURL: model.thumbURL)
            }
    }
}

extension PokeListViewModel {
    
    struct PokeItem {
        let name: String
        let thumbURL: URL
    }
}
