import SwiftyJSON
import UIKit

class UserRating {
    
    var id = 0
    var name = ""
    var surname = ""
    var middleName = ""
    var displayName = ""
    var avatar: String? = nil
    var rating = 0
    var firstAch: String? = nil
    var secondAch: String? = nil
    var restQuantityAch = 0
    var points = 0
    var level = 0
    var position = 0
    var score = 0
    var quantityGames = 0
    var correctAnswers = 0
    var inTeam =  false
    var wins = 0
    var defeats = 0
    var taskAmount = 0
    var taskCompleted = 0
    var spentQuestTime = 0
    var spentTaskTime = 0
    var hasBlockedTask = false
    var state: UserState = .ready
    
    // only for tower rating
    var status: StatusObject = .notStarted
    var playerLife: Int = 0
    var currentRound: Int = 0
    var totalRounds: Int = 0
    var timeAnswers: Int = 0
}

extension UserRating {
    
    func parse(json: JSON) async {
        id = json["player_id"].int ?? json["id"].intValue
        name = json["name"].stringValue
        surname = json["surname"].stringValue
        middleName = json["middle_name"].stringValue
        displayName = json["display_name"].stringValue
        level = json["level"].intValue
        rating = json["rating"].intValue
        points = json["points"].intValue
        position = json["position"].intValue
        score = json["score"].intValue
        quantityGames = json["quantity_games"].intValue
        correctAnswers = json["correct_answers"].intValue
        inTeam = json["in_team"].boolValue
        wins = json["wins"].intValue
        defeats = json["defeats"].intValue
        taskAmount = json["task_amount"].intValue
        taskCompleted = json["task_completed"].intValue
        spentTaskTime = json["spent_task_time"].intValue
        spentQuestTime = json["spent_quest_time"].intValue
        hasBlockedTask = json["has_blocked_task"].boolValue
        restQuantityAch = json["achievements"]["rest_quantity"].intValue
        state = Parse.shared.parseState(input: json["state"].stringValue)
        firstAch = json["achievements"]["first"].string
        secondAch = json["achievements"]["second"].string
        avatar = json["avatar"].string
        
        // only for tower rating
        status = Parse.shared.parseStatus(input: json["status"].stringValue)
        playerLife = json["player_life"].intValue
        currentRound = json["current_round"].intValue
        totalRounds = json["total_rounds"].intValue
        timeAnswers = json["time_answers"].intValue
    }
}
