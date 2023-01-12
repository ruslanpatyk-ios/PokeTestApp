import Foundation

class GetPokeDetailsRequest: Request {
    typealias Response = GetPokeDetailsResponse

    let url: URL
    
    init(url: String) {
        self.url = URL(string: url)!
    }
}
