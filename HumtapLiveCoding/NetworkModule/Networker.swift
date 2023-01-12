import Foundation

protocol Networking {
    func fetch<R: Request>(_ request: R, completion: @escaping (R.Response?) -> Void)
    func fetch<R: Request>(_ request: R, group: DispatchGroup?, completion: @escaping (R.Response?) -> Void)
}

class Networker: Networking {
    
    func fetch<R>(_ request: R, completion: @escaping (R.Response?) -> Void) where R : Request {
        fetch(request, group: nil, completion: completion)
    }
    
    func fetch<R>(_ request: R, group: DispatchGroup? = nil, completion: @escaping (R.Response?) -> Void) where R : Request {
        var urlRequest = URLRequest(url: request.url)
        
        urlRequest.httpMethod = request.method.rawValue
        
        group?.enter()
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, nil == error else {
                completion(nil)
                group?.leave()
                return
            }
            
            let decoded = try? request.decode(data)
            
            completion(decoded)
            
            group?.leave()
        }
        .resume()
    }
}


