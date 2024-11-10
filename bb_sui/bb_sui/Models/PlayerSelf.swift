import UIKit
import SwiftyJSON

class PlayerSelf {
    
//    var id = 0
//    var registrSite = ""
//    var name = ""
//    var surname = ""
//    var middleName = ""
//    var displayName = ""
//    var email = ""
//    var avatar = UIImage()
//    var birthdate = ""
//    var phone = "79"
//    var city = ""
//    var organization = ""
//    var officialPosition = ""
//    var expertTour = false
//    var isExpert: Bool = false
//    var emailValidated = true
//    var needEndOfRegistration = false
//    var level = 0
//    var points = 0
//    var achievementsAll = 0
//    var achievementsCompleted = 0
//    var nextLevelPointsMin = 0
//    var nextLevelPointsMax = 0
//    var state: UserState = .ready
//    var roles: [UserRole] = []
//    var achievements = [Achievement]()
//    var requiredFields: [String] = []
//    var optionsSubscribeEmail: Bool = false
//    var optionsQuestTour: Bool = false
//    var optionsExpertTour: Bool = false
        
//    func parse(json: JSON) async {
//        id = json["id"].intValue
//        registrSite = json["registr_site"].stringValue
//        name = json["name"].stringValue
//        surname = json["surname"].stringValue
//        middleName = json["middle_name"].stringValue
//        displayName = json["display_name"].stringValue
//        email = json["email"].stringValue
//        birthdate = json["birthday"].stringValue
//        phone = json["phone"].stringValue == "" ? "79" : json["phone"].stringValue
//        city = json["city_title"].stringValue
//        organization = json["organization"].stringValue
//        officialPosition = json["official_position"].stringValue
//        expertTour = json["expert_tour"].boolValue
//        isExpert = json["expert"].boolValue
//        emailValidated = json["email_validated"].boolValue
//        needEndOfRegistration = json["need_end_of_registration"].boolValue
//        level = json["level"].intValue
//        points = json["points"].intValue
//        achievementsAll = json["achievements"]["all"].intValue
//        achievementsCompleted = json["achievements"]["complete"].intValue
//        nextLevelPointsMin = json["next_level_points"]["min"].intValue
//        nextLevelPointsMax = json["next_level_points"]["max"].intValue
//        state = .ready
//        roles = Parse.parseRoles(input: json["roles"])
//        optionsSubscribeEmail = json["options"]["subscribe_email"].boolValue
//        optionsQuestTour = json["options"]["quest_tour"].boolValue
//        optionsExpertTour = json["options"]["expert_tour"].boolValue
//        //
//        for i in json["achievements"]["items"].arrayValue {
//            let achievement = Achievement()
//            achievement.parse(json: i)
//            achievements.append(achievement)
//        }
//        //
//        for i in json["required_fields"].arrayValue {
//            requiredFields.append(i.stringValue)
//        }
//        //
//        avatar = await API.shared._requestImage(link: json["avatar"].stringValue)
//    }
}
