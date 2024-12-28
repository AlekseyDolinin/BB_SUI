import UIKit
import SwiftyJSON

class Parse {
    
    static let shared = Parse()
//    
//    class func parseTypeQuestion(input: String) -> TypeQuestion {
//        switch input {
//        case "single":
//            return .single
//        case "multi":
//            return .multi
//        case "ranking":
//            return .ranking
//        case "matching":
//            return .matching
//        case "input_equals_all":
//            return .inputEqualsAll
//        case "input_equals_any":
//            return .inputEqualsAny // 1
//        case "input_contains_any":
//            return .inputContainsAny // 1
//        case "input_contains_all":
//            return .inputContainsAll // 1
//        default:
//            print("new type question: \(input)")
//            return .unowned
//        }
//    }
//    
//    class func parseCompetitionAnswers(json: JSON, completion: @escaping ([CompetitionAnswer]) -> ()) {
//        var listCompetitionAnswers = [CompetitionAnswer]()
//        for i in json.arrayValue {
//            let competitionAnswer = CompetitionAnswer()
//            competitionAnswer.id = i["id"].intValue
//            competitionAnswer.text = i["text"].stringValue
//            competitionAnswer.image = i["image"].stringValue
//            listCompetitionAnswers.append(competitionAnswer)
//        }
//        if listCompetitionAnswers.count == json.count {
//            completion(listCompetitionAnswers)
//        }
//    }
    
    func parseStatus(input: String) -> StatusObject {
        switch input {
        case "in_progress":
            return .inProgress
        case "failure", "failed":
            return .failure
        case "success", "finished":
            return .success
        case "blocked":
            return .blocked
        case "skipped":
            return .skipped
        case "completed":
            return .completed
        case "new":
            return .new
        case "error":
            return .error
        default:
            return .notStarted
        }
    }
    
//    class func parseTypeObjectTask(inputJSON: JSON) -> TypeObject? {
//        let objectType = inputJSON["object_type"].stringValue
//        let typeMaterial = inputJSON["material_type"].stringValue
//        switch objectType {
//        case "battle":
//            return .arena
//        case "battle_win":
//            return .arenaWin
//        case "course_module":
//            return .course
//        case "material":
//            return (typeMaterial == "url") ? .url : .file
//        case "video":
//            return .video
//        case "code_word":
//            return .codeWord
//        case "tournament":
//            return .tower
//        case "rating_scale":
//            return .rate
//        case "feedback":
//            return .fb
//        default:
//            return .check
//        }
//    }
    
    func parseTypeTask(input: String) -> TypeObject {
        switch input {
        case "quests", "quest", AppLanguage.shared.dict["quests"].stringValue:
            return .quest
        case "competitions", "competition", "Турниры":
            return .competition
        case "arena_battle", "locations", "arena", "battle", "Локации":
            return .arena
        case "arena_battle_win", "battle_win":
            return .arenaWin
        case "mountain_battle", "mountains", "mountain":
            return .mountain
        case "mountain_battle_win":
            return .mountainWin
        case "course_module", "course", "Курсы":
            return .course
        case "assigned_courses":
            return .assignedCourses
        case "url", "Ссылки":
            return .url
        case "file", "Файлы":
            return .file
        case "check":
            return .check
        case "video", "Видео":
            return .video
        case "code_word":
            return .codeWord
        case "tournament", "tournaments", "Башни":
            return .tower
        case "rating_scale":
            return .rate
        case "feedback":
            return .fb
        case "article", "Статьи":
            return .article
        case "event":
            return .event
        case "material":
            return .material
        case "task":
            return .task
        case "round":
            return .round
        case "events_chain":
            return .eventChain
        case "marathon":
            return .marathons
        case "testing":
            return .testing
        default:
            print("not parse type: \(input)")
            return .unknown
        }
    }
    
    func parseState(input: String) -> UserState {
        switch input {
        case "ready":
            return .ready
        case "online":
            return .online
        case "chosen":
            return .chosen
        case "offline":
            return .offline
        case "battle":
            return .battleLocation
        case "call":
            return .call
        case "accepted":
            return .accepted
        case "gathering":
            return .gathering
        case "busy":
            return .busy
        default:
            return .none
        }
    }
    
//    class func setColorIndicatorStatePlayer(playerState: UserState?) -> UIColor {
//        switch playerState {
//        case .battleLocation, .battleCompetition, .battleTower, .busy:
//            return .BB_RedUI
//        case .offline:
//            return .BB_BGTertiary
//        case .call:
//            return .BB_PrimaryUI
//        case .ready, .online:
//            return .BB_GreenUI
//        default:
//            return .clear
//        }
//    }
    
    func setEventRequestStatus(input: String) -> EventRequestStatus {
        switch input {
        case "on_approval":
            return .onApproval
        case "approved":
            return .approved
        case "rejected":
            return .rejected
        case "reserved":
            return .reserved
        case "revoked":
            return .revoked
        case "no_request":
            return .noRequest
        case "approved_by_manager":
            return .approvedByManager
        case "rejected_by_admin":
            return .rejectedByAdmin
        default:
            return .none
        }
    }
    
//    class func setMonth(index: Int) -> String {
//        switch index {
//        case 1:
//            return gDict["january"].stringValue
//        case 2:
//            return gDict["february"].stringValue
//        case 3:
//            return gDict["march"].stringValue
//        case 4:
//            return gDict["april"].stringValue
//        case 5:
//            return gDict["may"].stringValue
//        case 6:
//            return gDict["june"].stringValue
//        case 7:
//            return gDict["july"].stringValue
//        case 8:
//            return gDict["august"].stringValue
//        case 9:
//            return gDict["september"].stringValue
//        case 10:
//            return gDict["october"].stringValue
//        case 11:
//            return gDict["november"].stringValue
//        case 12:
//            return gDict["december"].stringValue
//        default:
//            return "Set Month Error"
//        }
//    }
//
//    class func getDataStatusEventChain(eventChain: EventsChain) -> String {
//        if Date() < eventChain.activeFrom {
//            return "Серия мероприятий планируется"
//        } else if Date() >= eventChain.activeFrom && Date() < eventChain.activeTo {
//            return "Серия мероприятий началась"
//        } else if Date() > eventChain.activeTo {
//            return "Серия мероприятий завершена"
//        } else {
//            return ""
//        }
//    }
//    
//    class func getDataStatusEvent(status: StatusObject) -> (icon: UIImage?, text: String, iconColor: UIColor) {
//        switch status {
//        case .rejected:
//            return (UIImage(systemName: "xmark.circle.fill"), gDict["e1"].stringValue, .BB_RedUI)
//        case .completed:
//            return (UIImage(systemName: "checkmark.circle.fill"), gDict["e2"].stringValue, .BB_GreenUI)
//        case .inProgress:
//            return (UIImage(systemName: "record.circle.fill"), gDict["e4"].stringValue, .systemYellow)
//        case .planned:
//            return (UIImage(systemName: "clock.circle"), gDict["e0"].stringValue, .orange)
//        default:
//            return (UIImage(systemName: "questionmark.square.fill"), "", .clear)
//        }
//    }
//    
//    class func getDataStatusRequest(status: EventRequestStatus, eventsChainID: Int? = nil) -> (icon: UIImage?, text: String, iconColor: UIColor) {
//        switch status {
//        case .onApproval:
//            return (UIImage(systemName: "clock.circle"), gDict["e5"].stringValue, .orange)
//        case .approved, .approvedByManager:
//            return (UIImage(systemName: "checkmark.circle.fill"), gDict["e6"].stringValue, .BB_GreenUI)
//        case .rejected, .rejectedByAdmin:
//            return (UIImage(systemName: "xmark.circle.fill"), gDict["e7"].stringValue, .BB_RedUI)
//        case .reserved:
//            return (UIImage(systemName: "clock.circle"), gDict["e8"].stringValue, .orange)
//        case .revoked:
//            return (UIImage(systemName: "xmark.circle.fill"), gDict["e17"].stringValue, .BB_RedUI)
//        case .noRequest:
//            let text = eventsChainID == nil ? gDict["e10"].stringValue : gDict["e20"].stringValue
//            return (UIImage(systemName: "pencil.circle.fill"), text, .orange)
//        default:
//            let text = eventsChainID == nil ? gDict["e10"].stringValue : gDict["e20"].stringValue
//            return (UIImage(systemName: "pencil.circle.fill"), text, .orange)
//        }
//    }
//    
//    class func setInfoForEvent(event: EventInCalendar) -> (icon: UIImage?, text: String, iconColor: UIColor?) {
//        if event.status == .rejected {
//            return (UIImage(systemName: "xmark.circle.fill"), gDict["e1"].stringValue, .BB_RedUI)
//        }
//        if event.status == .completed {
//            return (UIImage(systemName: "checkmark.circle.fill"), gDict["e2"].stringValue, .BB_GreenUI)
//        }
//        //
//        if event.activeTo < Date() {
//            return (UIImage(systemName: "clock.circle"), gDict["e3"].stringValue, .orange)
//        } else {
//            if event.status == .inProgress {
//                return (UIImage(systemName: "record.circle.fill"), gDict["e4"].stringValue, .systemYellow)
//            }
//            if event.status == .planned && event.eventRequestStatus == .onApproval {
//                return (UIImage(systemName: "clock.circle"), gDict["e5"].stringValue, .orange)
//            }
//            if event.status == .planned && (event.eventRequestStatus == .approved || event.eventRequestStatus == .approvedByManager) {
//                return (UIImage(systemName: "checkmark.circle.fill"), gDict["e6"].stringValue, .BB_GreenUI)
//            }
//            if event.status == .planned && event.eventRequestStatus == .rejected {
//                return (UIImage(systemName: "xmark.circle.fill"), gDict["e7"].stringValue, .BB_RedUI)
//            }
//            if event.status == .planned && event.eventRequestStatus == .reserved {
//                return (UIImage(systemName: "clock.circle"), gDict["e8"].stringValue, .orange)
//            }
//            if event.status == .planned && event.eventRequestStatus == .revoked {
//                return (UIImage(systemName: "xmark.circle.fill"), gDict["e17"].stringValue, .BB_RedUI)
//            }
//            if event.status == .planned && event.eventRequestStatus == .noRequest {
//                let text = event.eventsChainID == nil ? gDict["e10"].stringValue : gDict["e20"].stringValue
//                return (UIImage(systemName: "pencil.circle.fill"), text, .orange)
//            }
//            if event.status == .planned && event.eventRequestStatus == .none {
//                let text = event.eventsChainID == nil ? gDict["e10"].stringValue : gDict["e20"].stringValue
//                return (UIImage(systemName: "pencil.circle.fill"), text, .orange)
//            }
//        }
//        return (UIImage(systemName: "questionmark.square.fill"), "__", nil)
//    }
//    
//    class func setIconTypeTask(type: QuestTask.TypeTask) -> UIImage? {
//        switch type {
//        case .location(let type):
//            if type == .arena {
//                let icon = UIImage(named: "battleWin") ?? UIImage()
//                return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//            }
//            if type == .mountain {
//                let icon = UIImage(named: "climbIcon") ?? UIImage()
//                return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//            }
//        case .check:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "highlighter", withConfiguration: configuration)
//        case .course:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular)
//            return UIImage(systemName: "graduationcap.fill", withConfiguration: configuration)
//        case .file:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "arrow.down.doc.fill", withConfiguration: configuration)
//        case .url:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "link", withConfiguration: configuration)
//        case .video:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "play.fill", withConfiguration: configuration)
//        case .codeWord:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "key.viewfinder", withConfiguration: configuration)
//        case .tower:
//            let icon = UIImage(named: "towerIcon") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .rate:
//            let icon = UIImage(named: "taskIconRate") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .fb:
//            let icon = UIImage(named: "taskIconFB") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .event:
//            let icon = UIImage(named: "eventIcon") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .article:
//            let icon = UIImage(named: "articleIcon") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .unknown:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
//            return UIImage(systemName: "questionmark.app.dashed", withConfiguration: configuration)
//        }
//        return UIImage()
//    }
//    
//    class func setIconTypeActivityMarathon(type: ActivityMarathon.TypeActivity) -> UIImage? {
//        switch type {
//        case .location:
//            let icon = UIImage(named: "battleWin") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .course:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular)
//            return UIImage(systemName: "graduationcap.fill", withConfiguration: configuration)
//        case .file:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "arrow.down.doc.fill", withConfiguration: configuration)
//        case .url:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "link", withConfiguration: configuration)
//        case .video:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            return UIImage(systemName: "play.fill", withConfiguration: configuration)
//        case .tower:
//            let icon = UIImage(named: "towerIcon") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .event:
//            let icon = UIImage(named: "eventIcon") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .article:
//            let icon = UIImage(named: "articleIcon") ?? UIImage()
//            return icon.scaleImage(targetSize: CGSize(width: 16, height: 16)).withRenderingMode(.alwaysTemplate)
//        case .unknown:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
//            return UIImage(systemName: "questionmark.app.dashed", withConfiguration: configuration)
//        }
//    }

    func parseRoleInEvent(input: String?) -> UserRole {
        switch input {
        case "manager":
            return .manager
        case "expert":
            return .expert
        case "instructor":
            return .instructor
        case "trainingAdmin":
            return .trainingAdmin
        default:
            return .playerBasic
        }
    }
    
    
    func parseEventService(input: String?) -> EventService? {
        switch input {
        case "wbnrsu":
            return .wbnrsu
        case "livedigital":
            return .livedigital
        case "mtslink":
            return .mtslink
        default:
            return nil
        }
    }
    
//    class func parseOrderStatus(input: String) -> StatusObject {
//        switch input {
//        case "canceled":
//            return .canceled
//        case "completed":
//            return .completed
//        case "in_processing":
//            return .inProgress
//        default:
//            return .none
//        }
//    }
    
    func parseRoles(input: JSON) -> [UserRole] {
        var roles = [UserRole]()
        input.arrayValue.forEach { r in
            if r.stringValue == "training_admin" {
                roles.append(.trainingAdmin)
            }
            if r.stringValue == "instructor" {
                roles.append(.instructor)
            }
            if r.stringValue == "expert" {
                roles.append(.expert)
            }
            if r.stringValue == "manager" {
                roles.append(.manager)
            }
        }
        return roles
    }
    
    func parseSertificateCondition(input: String) -> CertificateCondition {
        switch input {
        case "all_completed":
            return .all
        case "required_completed":
            return .required
        case "selected_completed":
            return .selected
        case "completed":
            return .completed
        case "presencepresence":
            return .presence
        default:
            return .all
        }
    }
    
//    class func setTitleStatusRequest(input: EventRequestStatus) -> String {
//        switch input {
//        case .onApproval:
//            return "На рассмотрении"
//        case .approved:
//            return "Одобрена"
//        case .rejected:
//            return "Отклонена"
//        case .reserved:
//            return "Резерв"
//        case .revoked:
//            return "Отозвана"
//        case .noRequest:
//            return "noRequest"
//        case .notAccess:
//            return "notAccess"
//        case .approvedByManager:
//            return "Одобрена руководителем"
//        case .rejectedByAdmin:
//            return "Отклонена администратором"
//        default:
//            return input.rawValue
//        }
//    }
}
