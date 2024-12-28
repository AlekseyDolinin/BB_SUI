import SwiftUI

extension FeedbackAppView {
    
    @Observable
    class ViewModel {
        
        var typeFeedback: String = "error" {
            didSet {
                print("didSet")
                print("typeFeedback: \(typeFeedback)")
            }
        }
        
        var theme = ""
        var mail = ""
        var comment = ""

        func getUserName() -> String {
            let name = LocalStorage.shared.playerSelf.name
            let surname = LocalStorage.shared.playerSelf.surname
            return "\(surname) \(name)"
        }
    }
}
