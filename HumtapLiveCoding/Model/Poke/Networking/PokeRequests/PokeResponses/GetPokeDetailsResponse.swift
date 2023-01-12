import Foundation

class GetPokeDetailsResponse: Decodable  {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    
    let sprite: Sprite
}

extension GetPokeDetailsResponse {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case weight
        case height
        case sprite = "sprites"
    }
}

extension GetPokeDetailsResponse {
    
    struct Sprite: Decodable {
        let url: String

        private enum CodingKeys: String, CodingKey {
            case url = "front_default"
        }
    }
}
