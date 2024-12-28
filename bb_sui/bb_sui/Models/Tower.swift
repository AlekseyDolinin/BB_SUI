import SwiftyJSON
import UIKit

class Tower {
        
    var id: Int = 0
    var name: String = ""
    var receivedPoints: Int = 0
    var legend: Legend = .castle
    var playerPosition: Int = 0
    var passingPoints: Int = 0
    var playerLives: Int = 0
    var activeFrom: String = ""
    var activeTo: String = ""
    var linkImage: String = ""
    var allPosition: Int? = nil
    var status: StatusObject = .notStarted
    var retryType: String?
    var showReward: Bool?
    var retryDatetime: String? = nil
    var tournamentLives: Int = 0
    var retryAfterPeriod: Int = 0
    var restAttempts: Int = 0
    var score: Int = 0
    var currencyCount: Int = 0
    var needСheck: Bool = false
    var timeCurrentAttempt: Int? = nil
    var towerTime: Int? = nil
    var allowRestart: Bool = false
    var isAlreadyFinished: Bool = false
    var hint: String = ""
    var hasUncompletedPrerequisites: Bool = false
    var rounds: [Round] = []
    
    var selectRound: Round!
    
    enum Legend: String {
        case castle = "castle"
        case futuristic = "futuristic"
        case pink = "pink"
        case magic = "magic"
        case testing = "testing"
    }
    
    struct Round {
        var id: Int
        var nameRound = String()
        var questionsCount: Int = 0
        var score: Int = 0
        var status: StatusObject = .notStarted
        var activeFrom: String = ""
        var index: Int = 0
    }
    
    func openDetail() {
        DispatchQueue.main.async {
//            let vc = TowerDetailVC(tower: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func selectRound(index: Int) {
        selectRound = rounds[index]
    }
    
    func startTowerSocket() {
//        GlobalSocket.shared.send(parameters: ["type": "start_tdr",
//                                              "data": ["tournament_id": self.id,
//                                                       "round_id": selectRound.id]])
    }
}


extension Tower {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        receivedPoints = json["received_points"].intValue
        playerPosition = json["player_position"].intValue
        passingPoints = json["passing_points"].intValue
        playerLives = json["player_lives"].intValue
        activeFrom = json["active_from"].stringValue
        activeTo = json["active_to"].stringValue
        linkImage = json["image"].stringValue
        allPosition = json["all_position"].int
        status = Parse.shared.parseStatus(input: json["status"].stringValue)
        retryType = json["retry_limit_type"].stringValue
        showReward = json["show_reward"].boolValue
        retryDatetime = json["retry_datetime"].stringValue
        tournamentLives = json["tournament_lives"].intValue
        retryAfterPeriod = json["retry_after_period"].intValue
        restAttempts = json["rest_attempts"].intValue
        score = json["reward"].intValue
        currencyCount = json["currency_count"].intValue
        needСheck = json["need_check"].boolValue
        timeCurrentAttempt = json["time_current_attempt"].int
        towerTime = json["tournament_time"].int
        allowRestart = json["allow_restart"].boolValue
        isAlreadyFinished = json["is_already_finished"].boolValue
        hint = json["hint"].stringValue
        hasUncompletedPrerequisites = json["has_uncompleted_prerequisites"].boolValue
        rounds = await parseRounds(json: json["rounds"])
        parseLegend(input: json["legend"].stringValue)
    }
    
    func parseRounds(json: JSON) async -> [Round] {
        var rounds = [Round]()
        for i in json.arrayValue {
            let round = await parseRound(json: i)
            rounds.append(round)
        }
        return rounds
    }
    
    func parseRound(json: JSON) async -> Round {
        return Round(id: json["id"].intValue,
                     nameRound: json["name"].stringValue,
                     questionsCount: json["questions_count"].intValue,
                     score: json["score"].intValue,
                     status: Parse.shared.parseStatus(input: json["status"].stringValue),
                     activeFrom: json["active_from"].stringValue,
                     index: json["index"].intValue)
    }
    
    func parseLegend(input: String) {
        switch input {
        case "futuristic":
            self.legend = .futuristic
        case "pink":
            self.legend = .pink
        case "magic":
            self.legend = .magic
        case "castle", "grey":
            self.legend = .castle
        case "testing":
            self.legend = .testing
        default:
            self.legend = .futuristic
        }
    }
}
