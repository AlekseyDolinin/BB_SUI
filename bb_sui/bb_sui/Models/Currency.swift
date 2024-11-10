import UIKit
import SwiftyJSON

class Currency {
    
    var id: Int = 0
    var name: String = ""
    var iconCurrency: UIImage = UIImage()
}


extension Currency {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        getIconCurrency(link: json["image"].stringValue)
    }
    
    private func getIconCurrency(link: String) {
//        Task(priority: .userInitiated) {
//            let link = (LocalStorage.shared.url + link).decodeUrl
//            guard let url = URL(string: link) else { return }
//            iconCurrency = await API.shared.getSVG(url: url)
//        }
    }
}
