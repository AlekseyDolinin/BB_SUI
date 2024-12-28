import UIKit
import SwiftyJSON

class PlayerInTeam {
    
    var id: Int = 0
    var displayName: String = ""
    var avatar: UIImage = UIImage()
    var state: State = .online
    
    enum State {
        case online
        case offline
        case gathering
    }
}


extension PlayerInTeam {
    
    func parse(json: JSON) async {
        self.id = json["id"].intValue
        self.displayName = json["display_name"].stringValue
        //
        let link = json["image"].stringValue
        avatar = await API.shared._requestImage(link: link)
        setState(input: json["state"].stringValue)
    }
    
    func setState(input: String) {
        switch input {
        case "online":
            self.state = .online
        case "offline":
            self.state = .offline
        case "gathering":
            self.state = .gathering
        default:
            self.state = .offline
        }
    }
}
