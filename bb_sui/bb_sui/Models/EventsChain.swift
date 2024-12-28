import Foundation
import UIKit
import SwiftyJSON

class EventsChain {
        
    var id: Int = 0
    var name: String = ""
    var poster: UIImage? = nil
    var description: String = ""
    var activeFrom: Date? = nil
    var activeTo: Date? = nil
    var requestStatus: EventRequestStatus = .none
    var freeRequestCount: Int = 0
    var maxRequestCount: Int = 0
    var experts: [ExpertEventChain] = []
    var testingIn: TestSeriesEvent? = nil
    var testingOut: TestSeriesEvent? = nil
    var hasReport: Bool = false
    var reportHasBeenFormed: Bool = false
    var hasUncompletedPrerequisites: Bool = false
    var userIsExpert: Bool = false
    var certificates: [CertificateActivity] = []
    var events: [EventInCalendar] = []
    var hasResult: Bool = false
    var hasParticipants: Bool = false
    var requestID: Int = 0
        
    struct TestSeriesEvent {
        var id: Int
        var name: String
        var activeFrom: Date?
        var activeTo: Date?
        var status: StatusObject
        var type: TypeObject
    }
    
    struct ExpertEventChain {
        var id: Int
        var name: String
        var surname: String
    }
    
    func openDetail() {
//        DispatchQueue.main.async {
//            let vc = EventsChainDetailVC(eventChain: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    func openMyResult() {
//        let vc = MyResultSeriesEventVC(eventChain: self)
//        GetCurrentVC.get_().presentBottomSheet(vc: vc)
    }
    
    func openTestingIn() {
        if testingIn?.type == .tower {
            let tower = Tower()
            tower.id = testingIn?.id ?? 0
            tower.openDetail()
        }
        if testingIn?.type == .testing {
            let testing = Testing()
            testing.id = testingIn?.id ?? 0
            testing.openDetail()
        }
    }
    
    func openTestingOut() {
        if testingOut?.type == .tower {
            let tower = Tower()
            tower.id = testingOut?.id ?? 0
            tower.openDetail()
        }
        if testingOut?.type == .testing {
            let testing = Testing()
            testing.id = testingOut?.id ?? 0
            testing.openDetail()
        }
    }
}


extension EventsChain {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        activeFrom = json["active_from"].stringValue.toDate(.isoDateTimeSec)
        activeTo = json["active_to"].stringValue.toDate(.isoDateTimeSec)
        requestStatus = Parse.shared.setEventRequestStatus(input: json["request_status"].stringValue)
        freeRequestCount = json["free_request_count"].intValue
        maxRequestCount = json["max_request_count"].intValue
        experts = createExperts(json: json["experts"])
        testingIn = createTestSeriesEvent(json: json["entrance_test"])
        testingOut = createTestSeriesEvent(json: json["final_test"])
        hasReport = json["has_report"].boolValue
        reportHasBeenFormed = json["report_has_been_formed"].boolValue
        userIsExpert = setUserIsExperts(json: json["experts"])
        hasUncompletedPrerequisites = json["has_uncompleted_prerequisites"].boolValue
        certificates = createCertificates(json: json["certificates"])
        hasResult = json["has_result"].boolValue
        hasParticipants = json["has_participants"].boolValue
        requestID = json["request_id"].intValue
        //
        if let posterLink = json["image"].string {
            poster = await API.shared._requestImage(link: posterLink)
        }
        //
        events.removeAll()
        for i in json["events"].arrayValue {
            let event = EventInCalendar()
            await event.parse(json: i)
            events.append(event)
        }
    }
    
    private func createTestSeriesEvent(json: JSON) -> TestSeriesEvent? {
        if json.isEmpty { return nil }
        return TestSeriesEvent(
            id: json["id"].intValue,
            name: json["name"].stringValue,
            activeFrom: json["active_from"].stringValue.toDate(.isoDateTimeSec),
            activeTo: json["active_to"].stringValue.toDate(.isoDateTimeSec),
            status: Parse.shared.parseStatus(input: json["status"].stringValue),
            type: Parse.shared.parseTypeTask(input: json["type"].stringValue))
    }
    
    private func createCertificates(json: JSON) -> [CertificateActivity] {
        var certificates: [CertificateActivity] = []
        for i in json.arrayValue {
            let certificate = CertificateActivity(id: i["id"].intValue,
                                                  templateID: i["template_id"].intValue,
                                                  condition: Parse.shared.parseSertificateCondition(input: i["condition"].stringValue),
                                                  received: i["received"].boolValue)
            certificates.append(certificate)
        }
        return certificates
    }
    
    private func createExperts(json: JSON) -> [ExpertEventChain] {
        var experts = [ExpertEventChain]()
        for i in json.arrayValue {
            experts.append(ExpertEventChain(id: i["id"].intValue, name: i["name"].stringValue, surname: i["surname"].stringValue))
        }
        return experts
    }
    
    private func setUserIsExperts(json: JSON) ->Bool {
        let expertIDs = (json.arrayValue).map({$0["id"].intValue})
        return expertIDs.contains(LocalStorage.shared.playerSelf.id)
    }
}
