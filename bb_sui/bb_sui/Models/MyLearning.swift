import UIKit
import SwiftyJSON

class MyLearning {
        
    var objectID: Int = 0
    var name: String = ""
    var poster: String = ""
    var type: TypeObject = .unknown
    var status: StatusObject = .notStarted
    var activeFrom: Date? = nil
    var activeTo: Date? = nil
    var courseLearningID: Int = 0
}

extension MyLearning {
    
    func parse(json: JSON) async {
        objectID = json["object_id"].intValue
        name = json["name"].stringValue
        poster = json["image"].stringValue
        type = Parse.shared.parseTypeTask(input: json["object_type"].stringValue)
        status = Parse.shared.parseStatus(input: json["status"].stringValue)
        activeFrom = json["active_from"].string?.toDate(.isoDateTimeSec)
        activeTo = json["active_to"].string?.toDate(.isoDateTimeSec)
        courseLearningID = json["course_learning_id"].intValue
    }
}
