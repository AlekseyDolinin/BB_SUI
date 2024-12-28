import SwiftyJSON

class PageOnboarding {
    var id: Int = 0
    var order: Int = 0
    var image: String = ""
    var linkImage: String = ""
    var title: String = ""
    var text: String = ""
}


extension PageOnboarding {
    
    func parse(json: JSON) {
        id = json["id"].intValue
        order = json["order"].intValue
        linkImage = json["image"].stringValue
        title = json["title"].stringValue
        text = json["text"].stringValue
    }
}
