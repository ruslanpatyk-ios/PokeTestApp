import Foundation
import Combine

class PokeDetailsViewModel: ViewModel {

    private let responder: PokeDetailsResponder
    
    @Published var id: String
    @Published var name: String
    @Published var weight: String
    @Published var height: String
    @Published var thumbURL: URL
    
    init(pokeModel: PokeModel, responder: PokeDetailsResponder) {
        self.responder = responder
        self.id = "ID: \(pokeModel.id)"
        self.name = "NAME: \(pokeModel.name)"
        self.weight = "WEIGHT: \(pokeModel.weight)"
        self.height = "HEIGHT: \(pokeModel.height)"
        self.thumbURL = pokeModel.thumbURL
    }
    
    func onAppear() {

    }
    
    func onDisappear() {
        
    }
    
    @objc func onDismiss() {
        responder.onDismiss()
    }
}
