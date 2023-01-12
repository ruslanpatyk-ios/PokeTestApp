import UIKit
import Combine

class PokeDetailsMainView: UIView {
    
    private let viewModel: PokeDetailsViewModel
    
    private var stackView: UIStackView!
    private var imageView: URLImageView!
    
    private var idLabel: UILabel!
    private var nameLabel: UILabel!
    private var heightLabel: UILabel!
    private var weightLabel: UILabel!
    
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: PokeDetailsViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        performSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func performSetup() {
        addGestureRecognizer(UITapGestureRecognizer(target: viewModel, action: #selector(viewModel.onDismiss)))
        backgroundColor = .white
        
        addSubviews()
        addLayout()
        addBindings()
    }
    
    private func addSubviews() {
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        imageView = URLImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(imageView)
        
        idLabel = UILabel()
        idLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        idLabel.numberOfLines = 1
        
        stackView.addArrangedSubview(idLabel)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        nameLabel.numberOfLines = 1
        
        stackView.addArrangedSubview(nameLabel)
        
        heightLabel = UILabel()
        heightLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        heightLabel.numberOfLines = 1
        
        stackView.addArrangedSubview(heightLabel)
        
        weightLabel = UILabel()
        weightLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        weightLabel.numberOfLines = 1
        
        stackView.addArrangedSubview(weightLabel)
    }
    
    private func addLayout() {
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 88).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        idLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        heightLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func addBindings() {
        viewModel
            .$id
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] id in
                self?.idLabel.text = id
            })
            .store(in: &bag)
        
        viewModel
            .$name
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] name in
                self?.nameLabel.text = name
            })
            .store(in: &bag)
        
        viewModel
            .$weight
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] weight in
                self?.weightLabel.text = weight
            })
            .store(in: &bag)
        
        viewModel
            .$height
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] height in
                self?.heightLabel.text = height
            })
            .store(in: &bag)
        
        viewModel
            .$thumbURL
            .sink(receiveValue: { [weak self] thumbURL in
                self?.imageView.url = thumbURL
            })
            .store(in: &bag)
    }
}

extension PokeDetailsMainView {
    
    func willAppear() {
        viewModel.onAppear()
    }
    
    func willDisappear() {
        viewModel.onDisappear()
    }
}
