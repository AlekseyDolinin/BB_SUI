import SwiftyJSON
import UIKit

class Team {
    
    var id: Int = 0
    var name: String = ""
    var playersCount: Int = 0
    var avatar: UIImage = UIImage()
    var teameActive: Bool = true
    var dataRating: DataRating = DataRating()
    var players: [PlayerInTeam] = []
    
    struct DataRating {
        var score: Int = 0
        var correctAnswers: Int = 0
        var quantityGames: Int = 0
        var position: Int = 0
        var time: Int = 0
    }
    
    func openTeamProfile(competition: Competition) {
//        DispatchQueue.main.async {
//            let vc = TeamProfileVC(team: self, competition: competition)
//            GetCurrentVC.get_().presentBottomSheet(vc: vc)
//        }
    }
}

extension Team {
    
    func parse(json: JSON) async {
        id = json["team_id"].int ?? json["id"].intValue
        name = json["team_name"].string ?? json["name"].stringValue
        playersCount = json["team_players"].intValue
        teameActive = json["team_active"].bool ?? json["active"].boolValue
        parseDataRating(json: json)
        //
        let link = json["team_avatar"].string ?? json["avatar"].stringValue
        avatar = await API.shared._requestImage(link: link)
    }
    
    private func parseDataRating(json: JSON) {
        dataRating.score = json["score"].intValue
        dataRating.correctAnswers = json["correct_answers"].intValue
        dataRating.quantityGames = json["quantity_games"].intValue
        dataRating.position = json["position"].intValue
        dataRating.time = json["time"].intValue
    }
}
