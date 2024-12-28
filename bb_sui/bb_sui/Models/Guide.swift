import UIKit
import SwiftyJSON

class Guide {
    
    var id: Int = 0
    var code: String = ""
    var text: String = ""
    var mascot: String = ""
    var order: Int = 0
    var viewed: Bool = false
    var role: UserRole = .playerBasic
}

extension Guide {
    
    func parse(json: JSON) {
        id = json["id"].intValue
        code = json["code"].stringValue
        text = json["text"].stringValue
        mascot = json["mascot"].stringValue
        order = json["order"].intValue
        viewed = json["viewed"].boolValue
        role = Parse.shared.parseRoleInEvent(input: json["role"].stringValue)
    }
}
