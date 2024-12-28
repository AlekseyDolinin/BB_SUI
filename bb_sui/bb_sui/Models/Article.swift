import Foundation
import UIKit
import SwiftyJSON

class Article {
    
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var author: String = ""
    var createDate: Date? = nil
    var poster: UIImage = UIImage(named: "phCourse") ?? UIImage()
    
    func open() {
        DispatchQueue.main.async {
//            let vc = ArticleVC(article: self)
//            vc.modalPresentationStyle = .fullScreen
//            GetCurrentVC.get_().present(vc, animated: true)
        }
    }
}


extension Article {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        author = json["author"].stringValue
        createDate = json["create_date"].stringValue.toDate(.isoDateTimeSec)
        id = json["id"].intValue
        if let link: String = json["image"].string {
            self.poster = await API.shared._requestImage(link: link)
        }
    }
}
