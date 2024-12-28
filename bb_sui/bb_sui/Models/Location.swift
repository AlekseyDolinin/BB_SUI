import SwiftyJSON
import UIKit

class Location {
    
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    @Published var users = [UserRating]()
    var activeFrom: String = ""
    var activeTo: String = ""
    var new: Bool = false
    var unreadInvites: Int?
    var order = 0
    var timeLimit = 0
    var legend: Legend = .none
    var active: Bool!
    var posterLink: String = ""
    var themes: JSON!
    var options: JSON!
    var hint: String = ""
    
    enum Legend {
        case arena
        case mountain
        case none
    }
    
    func openDetail() {
        DispatchQueue.main.async {
//            let vc = LocationDetailVC(location: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func openDetailArchive() {
        DispatchQueue.main.async {
//            let vc = LocationDetailArchiveVC(location: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func openThemes() {
//        let list = themes.arrayValue.map({$0["name"].stringValue})
//        let vc = ModalLlistVC(title: "Темы", list: list)
//        GetCurrentVC.get_().presentBottomSheet(vc: vc)
    }
}


extension Location {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        activeFrom = json["active_from"].stringValue
        activeTo = json["active_to"].stringValue
        new = json["need_check"].boolValue
        unreadInvites = json["unread_invites"].intValue
        order = json["order"].intValue
        timeLimit = json["options"]["time_limit"].intValue
        active = json["active"].boolValue
        themes = json["themes"]
        options = json["options"]
        hint = json["hint"].stringValue
        posterLink = json["cover"].stringValue
        //
        parseLegend(input: json["legend"].stringValue)
    }
    
    func parseLegend(input: String) {
        switch input {
        case "mountain":
            self.legend = .mountain
        case "arena":
            self.legend = .arena
        default:
            self.legend = .none
        }
    }
}
