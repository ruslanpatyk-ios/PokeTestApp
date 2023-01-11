import UIKit

class PokeListMainView: UIView {
    
    private let viewModel: PokeListViewModel
    
    private let collectionView: UICollectionView
    
    init(viewModel: PokeListViewModel) {
        self.viewModel = viewModel
        self.collectionView = UICollectionView(frame: .zero)
        
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
        
    }
    
    private func addLayout() {
        
    }
    
    private func addBindings() {
        
    }
}
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let lay = collectionViewLayout as! UICollectionViewFlowLayout
//        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
//
//        return CGSize(width:widthPerItem, height:100)
//    }
