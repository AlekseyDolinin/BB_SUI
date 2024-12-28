import UIKit
import SwiftyJSON

class Marathon {
        
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var poster: String? = nil
    var status: StatusObject = .notStarted
    var startDate: Date = Date()
    var finishDate: Date = Date()
    var totalStageCount: Int = 0
    var stagePlayer: Int = 0
    var stagesForVictory: Int = 0
    var lives: Int = 0
    var score: Int = 0
    var hasEnoughLive: Bool = false
    var hint: String = ""
    var lotteryID: Int? = nil
    var coinCount: Int = 0
    
//    func openDetail() {
//        DispatchQueue.main.async {
//            let vc = MarathonDetailVC(marathon: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}


extension Marathon {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        status = Parse.shared.parseStatus(input: json["status"].stringValue)
        startDate = json["start_date"].string?.toDate(.isoDateTimeSec) ?? Date()
        finishDate = json["finish_date"].string?.toDate(.isoDateTimeSec) ?? Date()
        stagesForVictory = json["stages_for_victory"].intValue
        lives = json["lives"].intValue
        score = json["score"].intValue
        hasEnoughLive = json["has_enough_live"].boolValue
        hint = json["hint"].stringValue
        lotteryID = json["lottery_id"].int
        coinCount = json["currency"]["count"].intValue
        poster = json["image"].stringValue
        
        if let stageCountPlayer = json["stage_player_count"].int {
            stagePlayer = stageCountPlayer
        }
        if let totalStageCountMarathon = json["total_stage_count"].int {
            totalStageCount = totalStageCountMarathon
        }
    }
}
