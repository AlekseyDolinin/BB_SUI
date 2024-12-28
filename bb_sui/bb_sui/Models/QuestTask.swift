import SwiftyJSON
import UIKit

class QuestTask {
    
    var id: Int = 0
    var name: String = ""
    var posterLink: String = ""
    var poster: UIImage? = nil
    var type: TypeTask = .unknown
    var status: StatusTask = .notStarted
    var blocked: Bool = false
    var needToCertify: Bool = false
    var previousTaskID: Int? = nil
    var messageCount: Int = 0
    var playerScore: Int = 0
    var score: Int = 0
    // add on detail
    var isOptional: Bool = false
    var description: String = ""
    var relatedObjectFields: JSON = JSON()
    var hasTimer: Bool = false
    var maxScore: Int = 0
    // id задания (локации, башни ...)
    var objectID: Int = 0
    var restTime: Int? = nil
    var spentTime: Int? = nil
    
    enum StatusTask {
        case failure
        case notStarted
        case blocked
        case success
        case inProgress
        case skipped
    }
    
    enum TypeTask: Equatable {
        case location(type: TypeLocation)
        case check
        case course
        case file
        case url
        case video
        case codeWord
        case tower
        case rate
        case fb
        case event
        case article
        case unknown
        
        enum TypeLocation {
            case arena
            case mountain
        }
    }
}


extension QuestTask {

    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        posterLink = json["image"].stringValue
        needToCertify = json["need_to_certify"].boolValue
        previousTaskID = json["previous_task_id"].int
        messageCount = json["message_count"].intValue
        playerScore = json["player_score"].intValue
        score = json["score"].intValue
        // add on detail
        isOptional = json["optional"].boolValue
        description = json["description"].stringValue
        relatedObjectFields = json["related_object_fields"]
        hasTimer = json["has_timer"].boolValue
        maxScore = json["max_score"].intValue
        objectID = json["object_id"].intValue
        restTime = json["rest_time"].int
        spentTime = json["spent_time"].int
        //
        parseStatus(json: json)
        parseTypeTask(input: json["type"].stringValue)
    }
    
    //
    private func parseTypeTask(input: String) {
        switch input {
        case "arena", "arena_battle", "arena_battle_win":
            self.type = .location(type: .arena)
        case "mountain_battle", "mountain_battle_win":
            self.type = .location(type: .mountain)
        case "course_module":
            self.type = .course
        case "check":
            self.type = .check
        case "file":
            self.type = .file
        case "url":
            self.type = .url
        case "video":
            self.type = .video
        case "code_word":
            self.type = .codeWord
        case "tournament":
            self.type = .tower
        case "rating_scale":
            self.type = .rate
        case "feedback":
            self.type = .fb
        case "event":
            self.type = .event
        case "article":
            self.type = .article
        default:
            print("NEW TYPE TASK: \(input)")
            self.type = .unknown
        }
    }
    
    //
    private func parseStatus(json: JSON) {
        if json["blocked"].boolValue == true {
            status = .blocked
        } else {
            switch json["status"].stringValue {
            case "in_progress":
                status = .inProgress
            case "failure", "failed":
                status = .failure
            case "success", "finished":
                status = .success
            case "skipped":
                status = .skipped
            default:
                status = .notStarted
            }
        }
    }
}
