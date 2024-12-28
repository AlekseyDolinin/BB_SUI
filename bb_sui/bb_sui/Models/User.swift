import SwiftyJSON

class User {
    var id = 0
    var name = ""
    var surname = ""
    var middleName = ""
    var fio = ""
    var displayName = ""
    var state: UserState = .ready
    var linkAvatar = ""
    var officialPosition = ""
    /// список ролей текущего пользователя (приходит для чужого профиля)
    var currentPlayerRoles: [UserRole] = []
    
    var statistic = UserStatistic()
}


extension User {
    
    func parse(json: JSON) {
        id = json["player_id"].int ?? json["id"].intValue
        name = json["name"].string ?? json["player_name"].stringValue
        surname = json["surname"].string ?? json["player_surname"].stringValue
        middleName = json["middle_name"].stringValue
        fio = json["fio"].stringValue
        displayName = json["display_name"].string ?? json["player_display_name"].stringValue
        state = parseState(input: json["state"].stringValue)
        linkAvatar = json["avatar"].string ?? json["player_avatar"].string ?? json["image"].stringValue
        officialPosition = json["position"].string ?? json["official_position"].stringValue
        currentPlayerRoles = Parse.shared.parseRoles(input: json["current_player_roles"])
        //
        statistic.parse(json: json)
    }
    
    private func parseState(input: String) -> UserState {
        switch input {
        case "ready":
            return .ready
        case "online":
            return .online
        case "chosen":
            return .chosen
        case "offline":
            return .offline
        case "battle":
            return .battleLocation
        case "call":
            return .call
        case "accepted":
            return .accepted
        case "gathering":
            return .gathering
        case "busy":
            return .busy
        default:
            return .none
        }
    }
}
