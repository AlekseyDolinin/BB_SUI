import SwiftyJSON

class Achievement {
    
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var completed: Bool = false
    var allCount: Int = 0
    var playerCount: Int = 0
    var imageLink: String = ""
    
    func showDetail(selectUserID: Int) {
//        let vc = AchievementDetailVC(userID: selectUserID, achievement: self)
//        GetCurrentVC.get_().present(vc, animated: true)
    }
}

extension Achievement {
    
    func parse(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        completed = json["completed"].boolValue
        allCount = json["count"].intValue
        playerCount = json["player_count"].intValue
        imageLink = json["image"].stringValue
    }
}
