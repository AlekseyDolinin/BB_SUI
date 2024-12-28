import SwiftyJSON
import UIKit

class Competition {
        
    var id: Int = 0
    var name: String = ""
    var needCheck: Bool = false
    var inTeam: Bool = false
    var activeFrom: String = ""
    var activeTo: String = ""
    var teamPosition: Int = 0
    var description: String = ""
    var teamRatingEnabled: Bool = false
    var minPlayers: Int = 0
    var maxPlayers: Int = 0
    var hint: String? = nil
    var canEditTeam: Bool = false
    var myTeam: Team = Team()
    var posterLink: String = ""
        
    func open(team: Team? = nil) {
        inTeam ? openLobby() : openDetail()
    }
    
    func openEditTeam() {
//        DispatchQueue.main.async {
//            let vc = TeamEditVC(team: self.myTeam)
//            GetCurrentVC.get_().presentBottomSheet(vc: vc)
//        }
    }
    
    private func openLobby() {
//        DispatchQueue.main.async {
//            if GetCurrentVC.get_() is CompetitionLobbyVC { return }
//            let vc = CompetitionLobbyVC(competition: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    private func openDetail() {
//        DispatchQueue.main.async {
//            let vc = CompetitionDetailVC(competition: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    func openInArchive() {
//        DispatchQueue.main.async {
//            let vc = CompetitionArchiveVC(competition: self)
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
    }
}

extension Competition {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        needCheck = json["need_check"].boolValue
        inTeam = json["in_team"].boolValue
        activeFrom = json["active_from"].stringValue
        activeTo = json["active_to"].stringValue
        teamPosition = json["team_position"].intValue
        description = json["description"].stringValue
        teamRatingEnabled = json["team_rating_enabled"].boolValue
        minPlayers = json["min_players"].intValue
        maxPlayers = json["max_players"].intValue
        hint = json["hint"].string
        myTeam.id = json["team_id"].intValue
        canEditTeam = json["team_edit"].boolValue
        posterLink = json["image"].stringValue
    }
}
