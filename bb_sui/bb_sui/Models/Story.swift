import Foundation
import UIKit
import SwiftyJSON

enum ReactionsAlign {
    case horisontal
    case vertical
}

class Story: Identifiable {
    
    var id: Int = 0
    var title: String = ""
    var posterLink: String = ""
    var startDate: Date? = nil
    var finishDate: Date? = nil
    var viewed: Bool = false
    var isPin: Bool = false
    var sections: [SectionStory] = []
        
//    var currentSection: Int = 0
    
//    // просмотрены все части новости
//    private func seePartsStory(ids: [Int]) {
//        Task(priority: .userInitiated) {
//            let link = Endpoint.path(.sendIDsPartsNewSee)
//            _ = await API.shared._request(link, method: .post, parameters: ids)
//        }
//    }
}


extension Story {
    
    func parseStory(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        startDate = json["start_date"].stringValue.toDate(.isoDateTimeSec)
        finishDate = json["finish_date"].stringValue.toDate(.isoDateTimeSec)
        viewed = json["viewed"].boolValue
        isPin = json["is_pin"].boolValue
        posterLink = json["image"].stringValue
        //
        for i in json["news_parts"].arrayValue {
            let section = SectionStory()
            section.parse(json: i)
            self.sections.append(section)
        }
    }
}


class SectionStory: Identifiable {
    var id: Int = 0
    var colorBackground: String = ""
    var colorText: String = ""
    var title: String = ""
    var text: String = ""
    var image: String = ""
    var link: String = ""
    var sort: Int = 0
    var viewed: Bool = false
    var backgroundImage: String = ""
    var objectID: Int = 0
    var materialLink: String = ""
    var objectType: String = ""
    var isViewed: Bool = false
    var positiveReaction: ReactionStory? = nil
    var negativeReaction: ReactionStory? = nil
    var reactionsAlign: ReactionsAlign? = nil
    
    func parse(json: JSON) {
        self.id = json["id"].intValue
        self.colorBackground = json["color"].stringValue
        self.colorText = json["font_color"].stringValue
        self.title = json["title"].stringValue
        self.text = json["text"].stringValue
        self.image = json["image"].stringValue
        self.link = json["url"].stringValue
        self.sort = json["sort"].intValue
        self.viewed = json["viewed"].boolValue
        self.backgroundImage = json["background_image"].stringValue
        self.objectID = json["object_id"].intValue
        self.materialLink = json["material_url"].stringValue
        self.objectType = json["object_type"].stringValue
        self.positiveReaction = parseReaction(json: json["positive_reaction"])
        self.negativeReaction = parseReaction(json: json["negative_reaction"])
        self.reactionsAlign = parseReactionsAlign(input: json["reactions_align"].stringValue)
    }
    
    private func parseReaction(json: JSON) -> ReactionStory? {
        if json.isEmpty { return nil }
        let reaction = ReactionStory()
        reaction.id = json["id"].intValue
        reaction.count = json["count"].intValue
        reaction.selected = json["selected"].boolValue
        reaction.image = json["image"].stringValue
        return reaction
    }
    
    private func parseReactionsAlign(input: String) -> ReactionsAlign? {
        switch input {
        case "horizontal":
            return .horisontal
        case "vertical":
            return .vertical
        default:
            return nil
        }
    }
}


class ReactionStory: Identifiable {
    var id: Int = 0
    var image: String = ""
    var count: Int = 0
    var selected: Bool = false
}
