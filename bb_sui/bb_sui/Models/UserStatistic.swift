import SwiftyJSON

class UserStatistic {
    
    var level = 0
    var levelMax = 0
    var points = 0
    var rating = 0
    var companyLeaderboardCount = 0
    var battlesCount: Int {
        get { return wins + defeats }
    }
    var wins = 0
    var defeats = 0
    var nextLevelPointsMin = 0
    var nextLevelPointsMax = 0
    var correctAnswers = 0
    var quantityGames = 0
    var position = 0
    var score = 0
    var taskCompleted: Int = 0
    var taskAmount: Int = 0
    var spentTaskTime: Int = 0
    var spentQuestTime: Int = 0
    var currentRound: Int = 0
    var totalRounds: Int = 0
    var playerLife: Int = 0
    var timeAnswers: Int = 0
    var countTowers: Int = 0
    var countMarathons: Int = 0
    var countCourses: Int = 0
    var countEvents: Int = 0
    var countEventChains: Int = 0
    var countQuests: Int = 0
    var countCompetitions: Int = 0
    var countTests: Int = 0
    var achievements: JSON!
}


extension UserStatistic {
    
    func parse(json: JSON) {
        level = parseLevel(json: json)
        levelMax = json["max_level"].intValue
        points = parsePoints(json: json)
        rating = parseRating(json: json)
        companyLeaderboardCount = json["company_leaderboard_count"].intValue
        wins = parseWins(json: json)
        defeats = parseDefeats(json: json)
        nextLevelPointsMin = json["next_level_points"]["min"].intValue
        nextLevelPointsMax = json["next_level_points"]["max"].intValue
        correctAnswers = json["correct_answers"].intValue
        quantityGames = json["quantity_games"].intValue
        position = json["position"].intValue
        score = json["score"].intValue
        taskCompleted = json["task_completed"].intValue
        taskAmount = json["task_amount"].intValue
        spentTaskTime = json["spent_task_time"].intValue
        spentQuestTime = json["spent_quest_time"].intValue
        currentRound = json["current_round"].intValue
        totalRounds = json["total_rounds"].intValue
        playerLife = json["player_life"].intValue
        timeAnswers = json["time_answers"].intValue
        countTowers = json["tournaments"]["completed_count"].intValue
        countCourses = json["courses"]["completed_count"].intValue
        countQuests = json["quests"]["completed_count"].intValue
        countCompetitions = json["competitions"]["sessions_count"].intValue
        countTests = 33333
        achievements = json["achievements"]
    }
    
    private func parseLevel(json: JSON) -> Int {
        if json["player_level"].int != nil {
            return json["player_level"].intValue
        }
        if json["level"].int != nil {
            return json["level"].intValue
        }
        return 0
    }
    
    private func parsePoints(json: JSON) -> Int {
        if json["player_points"].int != nil {
            return json["player_points"].intValue
        }
        if json["points"].int != nil {
            return json["points"].intValue
        }
        return 0
    }
    
    private func parseRating(json: JSON) -> Int {
        if json["rating"].int != nil {
            return json["rating"].intValue
        }
        if json["company_leaderboard_rating"].int != nil {
            return json["company_leaderboard_rating"].intValue
        }
        return 0
    }
    
    private func parseWins(json: JSON) -> Int {
        if json["wins"].int != nil {
            return json["wins"].intValue
        } else {
            return json["battles"]["bot_wins"].intValue + json["battles"]["pvp_wins"].intValue
        }
    }
    
    private func parseDefeats(json: JSON) -> Int {
        if json["defeats"].int != nil {
            return json["defeats"].intValue
        } else {
            return json["battles"]["bot_looses"].intValue + json["battles"]["pvp_looses"].intValue
        }
    }
}
