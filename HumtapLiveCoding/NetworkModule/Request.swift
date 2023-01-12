import Foundation

enum RequestMethod: String {
    case get = "GET"
}

protocol Request {
    associatedtype Response
    
    var url: URL { get }
    var method: RequestMethod { get }
    
    func decode(_ data: Data) throws -> Response
}

extension Request {
    
    var method: RequestMethod { .get }
}

extension Request where Response: Decodable {
    
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        
        return try decoder.decode(Response.self, from: data)
    }
}
