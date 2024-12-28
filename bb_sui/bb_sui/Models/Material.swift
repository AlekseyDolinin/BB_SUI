import SwiftyJSON
import UIKit

class Material {
        
    var id: Int? = nil
    var name: String = ""
    var description: String = ""
    var type: String = ""
    var link: String = ""
    var size: Int = 0
    var poster: UIImage = UIImage()
    
    /// открывает ссылку в QuickLookFilePreview
    func open() {
//        OpenFile.shared.open(link: link)
    }
}


extension Material {
    
    func parse(json: JSON) async {
        id = json["id"].int
        name = json["name"].stringValue
        description = json["description"].stringValue
        type = json["type"].stringValue
        link = json["url"].stringValue
        size = json["size"].intValue
        //
        if let posterLink = json["image"].string {
            poster = await API.shared._requestImage(link: posterLink)
        }
    }
}
