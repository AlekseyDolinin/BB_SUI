import SwiftyJSON
import UIKit

class Widget {
        
    var id: Int = 0
    var name: String = ""
    var objectType: TypeObject = .unknown
    var objectID: Int = 0
    var objectName: String = ""
    var poster: String? = nil
    
    func open() {
        switch objectType {
        case .url:
            print("url")
        case .file:
            print("file")
        case .course, .assignedCourses, .programm:
            let course = Course()
            course.id = objectID
            course.openDetail()
        case .arenaWin, .arena, .mountainWin, .mountain:
            let location = Location()
            location.id = objectID
            location.openDetail()
        case .video:
            let video = Video()
            video.id = objectID
            video.openDetail()
        case .tower:
            let tower = Tower()
            tower.id = objectID
            tower.openDetail()
        case .article:
            let article = Article()
            article.id = objectID
            article.open()
        case .event:
            let event = EventInCalendar()
            event.id = objectID
            event.openDetailEvent()
        case .eventChain:
            let eventsChain = EventsChain()
            eventsChain.id = objectID
            eventsChain.openDetail()
        case .quest:
            let quest = Quest()
            quest.id = objectID
            quest.openDetail()
        case .competition:
            openCompetition(id: objectID)
        case .testing:
            let testing = Testing()
            testing.id = objectID
            testing.openDetail()
        default:
            break
        }
    }
    
    private func openCompetition(id: Int) {
//        Task(priority: .userInitiated) {
//            let link = Endpoint.path(.getDataCompetition(idCompetition: id))
//            let json = await API.shared._request(link)
//            if let json = json {
//                LocalStorage.shared.playerSelf.state = .battleCompetition
//                let competition = Competition()
//                await competition.parse(json: json)
//                competition.open()
//                GlobalSocket.shared.send(parameters: ["type": "competition_lobby_update_state",
//                                                      "data": ["competition_id": competition.id]])
//            }
//        }
    }
}


extension Widget {
    
    func parse(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        objectType = Parse.shared.parseTypeTask(input: json["object_type"].stringValue)
        objectID = json["object_id"].intValue
        objectName = json["object_name"].stringValue
        poster = json["image"].string
    }
}
