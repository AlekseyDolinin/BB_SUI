import UIKit
import SwiftyJSON

class EventInCalendar {
        
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var poster: UIImage? = nil
    var eventType: EventType = .offline
    var status: StatusObject = .planned
    var location: String = ""
    var activeFrom: Date? = nil
    var activeTo: Date? = nil
    var eventRequestStatus: EventRequestStatus = .noRequest
    var playerIsExpert: Bool = false
    var videoEventID: Int? = nil
    var eventRequestID: Int? = nil
    var freeRequestCount: Int = 0
    var maxRequestCount: Int = 0
    var needApprovalRequest: Bool = false
    var materials: [Material] = []
    var feedbackShowButton: Bool = false
    var feedbackAverageValue: Int? = nil
    var score: Int = 0
    var currencyCount: Int = 0
    var playerScore: Int = 0
    var hint: String = ""
    var eventService: EventService? = nil
    var webinarUrl: String? = nil
    var playerIsLector: Bool = false
    var hasUncompletedPrerequisites: Bool = false
    var certificates: [CertificateActivity] = []
    var select: Bool = false
    var responsible: String = ""
    var canEditTimig: Bool = false
    var experts: String = "-"
    var eventsChainName: String? = nil
    var eventsChainID: Int? = nil
    var attendanceStatus: AttendedStatusEvent = .notAttended
        
    func signUpPlayer(selectUser: User) {
        Task(priority: .userInitiated) {
            // пересекающееся мероприятие
            let intersectionEvent = await checkHasIntersection(playerID: selectUser.id)
            if let event = intersectionEvent   {
                showModalHasIntersection(selectUser: selectUser, intersectionEvent: event)
            } else {
                showAlertSignIn(selectUser: selectUser)
            }
        }
    }
    
    private func checkHasIntersection(playerID: Int) async -> EventInCalendar? {
        let link = Endpoint.path(.checkIntersection(playerID: playerID, eventID: id))
        let response = await API.shared._request(link, method: .post)
        if let json = response?.json {
            guard let first = json["events"].arrayValue.first else { return nil }
            let event = EventInCalendar()
            await event.parse(json: first)
            return event
        } else {
            return nil
        }
    }
    
    private func showModalHasIntersection(selectUser: User, intersectionEvent: EventInCalendar) {
//        let vc = ModalForseSignInVC(selectUser: selectUser,
//                                    intersectionEvent: intersectionEvent,
//                                    eventForSignIn: self)
//        GetCurrentVC.get_().presentBottomSheet(vc: vc)
    }
    
    private func showAlertSignIn(selectUser: User) {
        DispatchQueue.main.async {
//            let title = "Пользователь \(selectUser.displayName) будет записан на мероприятие «\(self.name)»"
//            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
//            let signUpAction = UIAlertAction(title: gDict["check_in"].stringValue, style: .default) { _ in
//                GetCurrentVC.get_().showLoader()
//                self.signUpProcess(player: selectUser)
//            }
//            alert.addAction(UIAlertAction(title: gDict["cancel"].stringValue, style: .destructive))
//            alert.addAction(signUpAction)
//            GetCurrentVC.get_().present(alert, animated: true)
        }
    }
    
    func signUpProcess(player: User) {
        Task(priority: .userInitiated) {
            let parameters: [String : Any] = ["player_id": player.id]
            let link = Endpoint.path(.eventRequest(eventID: id))
            let response = await API.shared._request(link, method: .post, parameters: parameters)
            if let json = response?.json {
                if json["event_request_status"].stringValue == "on_approval" || json["event_request_status"].stringValue == "approved" {
                    self.showAlertSignUpProcessSuccess()
                }
            }
        }
    }
    
    private func showAlertSignUpProcessSuccess() {
        DispatchQueue.main.async {
//            GetCurrentVC.get_().hideLoader()
//            let title = "Пользователь успешно записан на мероприятие"
//            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: gDict["ok"].stringValue, style: .destructive))
//            GetCurrentVC.get_().present(alert, animated: true)
        }
    }
    
    func openDetailEvent() {
        DispatchQueue.main.async {
//            let vc = EventDetailVC(eventInCalendar: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func openFeedback() {
//        let vc = EventFBVC()
//        vc.eventInCalendar = self
//        vc.hidesBottomBarWhenPushed = true
//        GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
    }
    
    func editTiming() {
//        let vc = EditTimingEventVC(eventInCalendar: self)
//        GetCurrentVC.get_().presentBottomSheet(vc: vc)
    }
}


extension EventInCalendar {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        eventType = setEventType(input: json["event_type"].stringValue)
        status = setStatusEvent(input: json["status"].stringValue)
        location = json["location"].stringValue
        activeFrom = json["active_from"].stringValue.toDate(.isoDateTimeSec)
        activeTo = json["active_to"].stringValue.toDate(.isoDateTimeSec)
        playerIsExpert = json["player_is_expert"].boolValue
        videoEventID = json["video_id"].int
        eventRequestID = json["event_request_id"].int
        freeRequestCount = json["free_request_count"].intValue
        maxRequestCount = json["max_request_count"].intValue
        needApprovalRequest = json["need_approval_request"].boolValue
        feedbackShowButton = json["feedback"]["show_button"].boolValue
        feedbackAverageValue = json["feedback"]["average_value"].intValue
        score = json["event_score"].intValue
        playerScore = json["player_score"].intValue
        hint = json["hint"].stringValue
        eventService = Parse.shared.parseEventService(input: json["event_service"].string)
        playerIsLector = json["player_is_lector"].boolValue
        hasUncompletedPrerequisites = json["has_uncompleted_prerequisites"].boolValue
        certificates = createCertificates(json: json["certificates"])
        responsible = json["responsible"].stringValue
        canEditTimig = json["has_change_permission"].boolValue
        eventsChainName = json["events_chain_name"].string
        eventsChainID = json["events_chain_id"].int
        attendanceStatus = parseAttendedStatusEvent(input: json["attendance_status"].stringValue)
        //
        await parseMaterials(json: json["materials"])
        //
        let status: String = json["event_request_status"].string ?? json["request_status"].stringValue
        eventRequestStatus = Parse.shared.setEventRequestStatus(input: status)
        //
        if let posterLink = json["image"].string {
            poster = await API.shared._requestImage(link: posterLink)
        }
    }
    
    private func setStatusEvent(input: String) -> StatusObject {
        switch input {
        case "planned":
            return .planned
        case "in_progress":
            return .inProgress
        case "completed":
            return .completed
        case "rejected":
            return .rejected
        default:
            return .none
        }
    }
    
    private func setEventType(input: String) -> EventType {
        switch input {
        case "online":
            return .online
        default:
            return .offline
        }
    }
    
    private func parseAttendedStatusEvent(input: String) -> AttendedStatusEvent {
        switch input {
        case "not_attended":
            return .notAttended
        case "attended":
            return .attended
        case "semi_attended":
            return .semiAttended
        default:
            return .notAttended
        }
    }
    
    /// парсинг списка экспертов мероприятия
    /// показываем только первого эксперта
    /// если экспертов больше 1 - добавляем "..." в конце
    /// просмотр всех экспертов в модалке со списком
    func parseExperts(json: JSON) {
        if let firstExpert = json["objects"].arrayValue.first {
            self.experts = firstExpert["name"].stringValue
            if json["objects"].arrayValue.count > 1 {
                experts += "..."
            }
        }
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
    
    private func parseMaterials(json: JSON) async {
        for i in json.arrayValue {
            let material = Material()
            await material.parse(json: i)
            self.materials.append(material)
        }
    }
}


enum EventService {
    case livedigital
    case wbnrsu
    case mtslink
}


struct CertificateActivity {
    var id: Int = 0
    var templateID: Int = 0
    var condition: CertificateCondition
    var received: Bool = false
}
