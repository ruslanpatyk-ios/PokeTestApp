import UIKit

class PokeListCell: UICollectionViewCell {
    
    private var containerView: UIView!
    private var label: UILabel!
    private var imageView: URLImageView!
    
    var text: String {
        set { label.text = newValue.capitalized }
        get { label.text ?? "" }
    }
    
    var URL: URL? {
        set { imageView.url = newValue }
        get { imageView.url }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView = UIView(frame: frame)
        containerView.layer.isOpaque = true
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1.5
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: .current)
        
        contentView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        imageView = URLImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        containerView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokeListCell {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
