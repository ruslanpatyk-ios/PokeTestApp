import Foundation
import Combine

class PokeRootViewModel: ViewModel {
    
    @Published var view = View.list
    
    func onAppear() { }
    func onDisappear() { }
}

extension PokeRootViewModel: PokeListResponder {
    
    func onPokeSelected(poke: PokeModel) {
        view = .details(poke)
    }
}

extension PokeRootViewModel: PokeDetailsResponder {
    
    func onDismiss() {
        view = .list
    }
}

extension PokeRootViewModel {
    
    enum View: Hashable {
        case list
        case details(PokeModel)
    }
}
