import SwiftyJSON
import SwiftUI

@Observable
class LocalStorage {
    
    static let shared = LocalStorage()
            
    var hostname = "" {
        didSet {
            self.url = "https://" + hostname
        }
    }
    var url: String = ""
    
    //
    var userDataJSON = JSON()
    
    // опции тенанта
    var optionsTenant = JSON()
    
    var playerSelf = PlayerSelf()
    var currency: Currency!

    var guides = [Guide]()
    var guideRequired = false
    var pagesOnboarding = [PageOnboarding]()
    
    var selectStory = Story()
}
