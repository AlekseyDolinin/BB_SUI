import UIKit
import SwiftyJSON

class Currency {
    
    var id: Int = 0
    var name: String = ""
    var link: String = ""
    var iconCurrency: UIImage = UIImage()
}


extension Currency {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        name = json["image"].stringValue
        getIconCurrency(link: json["image"].stringValue)
    }
    
    private func getIconCurrency(link: String) {

    }
}
