import Foundation

class GetPokeListRequest: Request {
    typealias Response = GetPokeListResponse
    
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
}
