import SwiftyJSON

class LocalStorage {
    
    static let shared = LocalStorage()
        
    var hostname = "" {
        didSet {
            self.url = "https://" + hostname
        }
    }
    var url: String = ""
    
    //
    var userDataJSON: JSON!
    
    // опции тенанта
    var optionsTenant = JSON()
    
    var playerSelf: PlayerSelf!
    
//    var opponentInBattleLocation: UserRating!
    
    var currency: Currency!
    
//    var store = Set<AnyCancellable>()
}
