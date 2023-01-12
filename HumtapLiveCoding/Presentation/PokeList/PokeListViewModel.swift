import Foundation
import Combine

class PokeListViewModel: ViewModel {
    
    private let repository: PokeRepository
    private let responder: PokeListResponder
    
    @Published var title = "Poke Challenge"
    @Published var items = [PokeItem]()
    
    init(repository: PokeRepository, responder: PokeListResponder) {
        self.repository = repository
        self.responder = responder
    }
    
    func onAppear() {
        repository.fetch(completion: { [weak self] models in
            self?.items = models.map { PokeItem(model: $0) }
        })
    }
    
    func onDisappear() {
        
    }
    
    func onSelected(item: PokeItem) {
        responder.onPokeSelected(poke: item.model)
    }
}

extension PokeListViewModel {
    
    enum PokeSection {
      case `default`
    }
    
    struct PokeItem: Hashable {
        var name: String { model.name }
        var thumbURL: URL { model.thumbURL }
        
        fileprivate let model: PokeModel
        
        init(model: PokeModel) {
            self.model = model
        }
    }
}
