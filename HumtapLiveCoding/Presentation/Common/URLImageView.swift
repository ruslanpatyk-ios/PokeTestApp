import UIKit

class URLImageView: UIImageView {
    
    var url: URL? {
        didSet {
            guard let url = url else { return }
            
            DispatchQueue.global().async { [url, weak self] in
                guard let self = self else { return }
                
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            if self.url == url {
                                self.image = image
                            }
                        }
                    }
                }
            }
        }
    }
}
