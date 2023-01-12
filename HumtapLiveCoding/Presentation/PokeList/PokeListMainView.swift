import UIKit
import Combine

class PokeListMainView: UIView {
    
    private let viewModel: PokeListViewModel
    
    private var collectionView: UICollectionView!
    
    private lazy var dataSource: DataSource = {
        makeDataSource()
    }()
    
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: PokeListViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        performSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func performSetup() {
        addSubviews()
        addLayout()
        addBindings()
    }
    
    private func addSubviews() {
        let width = UIScreen.main.bounds.width * 0.4
        let height = width * 0.65
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 28, bottom: 10, right: 28)
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(PokeListCell.self, forCellWithReuseIdentifier: PokeListCell.reuseIdentifier)
        
        addSubview(collectionView)
    }
    
    private func addLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func addBindings() {
        viewModel
            .$items
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] items in
                self?.applySnapshot(items: items)
            })
            .store(in: &bag)
    }
    
    private func applySnapshot(items: [PokeListViewModel.PokeItem]) {
        var snapshot = Snapshot()
        
        snapshot.appendSections([.default])
        snapshot.appendItems(items)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) ->
            UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeListCell.reuseIdentifier,
                                                          for: indexPath) as! PokeListCell
            cell.text = item.name
            cell.URL = item.thumbURL
            
            return cell
        })
        return dataSource
    }
}

extension PokeListMainView {
    
    func willAppear() {
        viewModel.onAppear()
    }
    
    func willDisappear() {
        viewModel.onDisappear()
    }
}

extension PokeListMainView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = dataSource.itemIdentifier(for: indexPath) {
            viewModel.onSelected(item: item)
        }
    }
}

extension PokeListMainView {
    typealias DataSource = UICollectionViewDiffableDataSource<PokeListViewModel.PokeSection, PokeListViewModel.PokeItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<PokeListViewModel.PokeSection, PokeListViewModel.PokeItem>
}
