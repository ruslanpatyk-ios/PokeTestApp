import Foundation

class GetPokeListResponse: Decodable {
    let entries: [PokeEntry]
}

extension GetPokeListResponse {
    
    struct PokeEntry: Decodable  {
        let name: String
        let url: String
    }
}

extension GetPokeListResponse {
    
    private enum CodingKeys: String, CodingKey {
        case entries = "results"
    }
}
