import Foundation
import UIKit
import SwiftyJSON

class Testing {
    
    var id: Int = 0
    var status: StatusObject = .notStarted
    var name: String = ""
    var poster: String = ""
    var comment: String = ""
    var finishCount: Int = 0
    var startDate: Date? = nil
    var planDate: Date? = nil
    var selfAppointment: Bool = false
    var certificates = [CertificateActivity]()
    var score: Int = 0
    var passScore: Int = 0
    var maxScore: Int = 0
    var pointsReceived: Bool = false
    var pointsCount: Int = 0
    var appointmentID: Int?  = nil
    var appointmentDuration: Int = 0
    var hint: String = ""
    var attempts: Int = 0
    var restAttempts: Int = 0
    var partCount: Int = 0
    var hasPrerequisites: Bool = false
    var hasCompletedAppointments: Bool = false
    var timeLimit: Int = 0
    var questionCount: Int = 0
    /// attempt_priority - [str] - best | last (для вывода нужного теста у модалок)
    var attemptPriority: AttemptPriority = .none
    var currencyReceived: Bool = false
    var currencyCount: Int = 0
    /// next_testing_part - [obj] - информация по следующему блоку тестирования
    var nextTestingBlock = NextTestingBlock()
    var materials: [Material] = []
    
    enum AttemptPriority {
        case best
        case last
        case none
    }
    
    struct NextTestingBlock {
        var id: Int = 0
        var name: String = ""
        var order: Int = 0
        var timeLimit: Int = 0
        var maxScore: Int = 0
        var restAttempts: Int = 0
        var attempts: Int = 0
        var partCount: Int = 0
    }
    
    func openDetail() {
//        DispatchQueue.main.async {
//            let vc = TestingDetailVC(testing: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
    }
}

extension Testing {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        status = Parse.shared.parseStatus(input: json["status"].stringValue)
        name = json["name"].stringValue
        finishCount = json["finish_count"].intValue
        comment = json["description"].stringValue
        startDate = json["start_date"].stringValue.toDate(.isoDateTimeSec)
        planDate = json["plan_date"].stringValue.toDate(.isoDateTimeSec)
        selfAppointment = json["self_appointment"].boolValue
        certificates = parseCertificates(json: json)
        score = json["score"].intValue
        passScore = json["pass_score"].intValue
        maxScore = json["max_score"].intValue
        pointsReceived = json["points"]["received"].boolValue
        pointsCount = json["points"]["count"].intValue
        appointmentID = json["appointment_id"].int
        appointmentDuration = json["appointment_duration"].intValue
        hint = json["hint"].stringValue
        attempts = json["attempts"].intValue
        restAttempts = json["rest_attempts"].intValue
        partCount = json["part_count"].intValue
        hasPrerequisites = json["has_uncompleted_prerequisites"].boolValue
        hasCompletedAppointments = json["has_completed_appointments"].boolValue
        timeLimit = json["time_limit"].intValue
        questionCount = json["question_count"].intValue
        attemptPriority = parseaAttemptPriority(input: json["attempt_priority"].stringValue)
        currencyReceived = json["currency"]["received"].boolValue
        currencyCount = json["currency"]["count"].intValue
        nextTestingBlock = parseNextTestingBlock(json: json["next_testing_part"])
        poster = json["cover"].stringValue
        materials = await parseMaterials(json: json["materials"])
    }
    
    func parseNextTestingBlock(json: JSON) -> NextTestingBlock {
        let nextTestingPart = NextTestingBlock(id: json["id"].intValue,
                                               name: json["name"].stringValue,
                                               order: json["order"].intValue,
                                               timeLimit: json["time_limit"].intValue,
                                               maxScore: json["max_score"].intValue,
                                               restAttempts: json["rest_attempts"].intValue,
                                               attempts: json["attempts"].intValue,
                                               partCount: json["part_count"].intValue)
        return nextTestingPart
    }
    
    private func parseCertificates(json: JSON) -> [CertificateActivity] {
        var certificates: [CertificateActivity] = []
        for i in json["certificates"].arrayValue {
            let certificate = CertificateActivity(id: i["id"].intValue,
                                                  templateID: i["template_id"].intValue,
                                                  condition: Parse.shared.parseSertificateCondition(input: i["condition"].stringValue),
                                                  received: i["received"].boolValue)
            certificates.append(certificate)
        }
        return certificates
    }
    
    private func parseaAttemptPriority(input: String) -> AttemptPriority {
        switch input {
        case "best":
            return .best
        case "last":
            return .last
        default:
            return .none
        }
    }
    
    private func parseMaterials(json: JSON) async -> [Material] {
        var materials: [Material] = []
        for i in json.arrayValue {
            let material = Material()
            await material.parse(json: i)
            materials.append(material)
        }
        return materials
    }
}
