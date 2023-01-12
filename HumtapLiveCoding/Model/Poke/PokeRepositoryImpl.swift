import Foundation

class PokeRepositoryImpl: PokeRepository {
    
    private let networker: Networking
    
    required init(networker: Networking) {
        self.networker = networker
    }
    
    func fetch(completion: @escaping ([PokeModel]) -> Void) {
        var models = [PokeModel]()
        
        networker.fetch(GetPokeListRequest()) { response in
            let urls = response?.entries.map { $0.url } ?? []
            
            let group = DispatchGroup()
            
            urls.forEach { [weak self] in
                self?.networker.fetch(GetPokeDetailsRequest(url: $0),
                                      group: group) { response in
                    if let response = response {
                        models.append(PokeModel(response: response))
                    }
                }
            }
            
            group.notify(queue: .main) {
                completion(models)
            }
        }
    }
}

private extension PokeModel {
    
    init(response: GetPokeDetailsResponse) {
        self.id = response.id
        self.name = response.name
        self.weight = response.weight
        self.height = response.height
        self.thumbURL = URL(string: response.sprite.url)!
    }
}
