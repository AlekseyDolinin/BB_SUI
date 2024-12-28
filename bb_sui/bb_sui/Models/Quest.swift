import UIKit
import SwiftyJSON

class Quest {
    
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    /// дата начала
    var activeFrom: Date? = nil
    /// дата завершения
    var activeTo: Date? = nil
    /// показывать до даты начала?
    var showBeforeStart: Bool = false
    /// подсказка
    var hint: String = ""
    /// статус прохождения ('not_started', 'in_progress', 'finished')
    var status: StatusObject = .notStarted
    /// количество полученных очков за квест
    var score: Int = 0
    /// показывать рейтинг?
    var ratingEnabled: Bool = false
    /// процент прохождения
    var progress: Int = 0
    /// необходимость выполнения пререквезитов
    var hasPrerequisites: Bool = false
    /// id последнего открытого задания
    var lastTaskID: Int? = nil
    var currencyID: Int? = nil
    var currencyReceived: Bool? = nil
    var currencyCount: Int = 0
    /// массив данных по сертификатам
    var certificates: [CertificateActivity] = []
    /// объект рейтинга
    var rating: Rating = Rating()
    var messageCount: Int = 0
    var averageTime: Int = 0
    var completed: Bool = false
    var tasksAmount: Int = 0
    var tasksCompleted: Int = 0
    var hasInvite: Bool = false
    var posterLink: String = ""
    
    var tasks: [QuestTask] = []
    
    struct Rating {
        /// позиция игрока
        var playerPosition: Int? = nil
        /// всего мест в рейтинге
        var total: Int = 0
    }
    
    func openDetail() {
//        DispatchQueue.main.async {
//            let vc = QuestDetailVC(quest: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
    }

}


extension Quest {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        showBeforeStart = json["show_before_start"].boolValue
        hint = json["hint"].stringValue
        score = json["score"].intValue
        ratingEnabled = json["rating_enabled"].boolValue
        progress = json["progress"].intValue
        hasPrerequisites = json["has_uncompleted_prerequisites"].boolValue
        lastTaskID = json["last_task_id"].int
        currencyID = json["currency_id"].int
        currencyCount = json["currency_count"].intValue
        activeTo = json["active_to"].stringValue.toDate(.isoDateTimeSec)
        activeFrom = parseOptionalDate(input: json["active_from"].string)
        certificates = parseCertificates(json: json)
        status = parseStatus(json: json)
        rating = parseRating(json: json)
        messageCount = json["new_message_count"].int ?? json["message_count"].intValue
        averageTime = json["average_time"].intValue
        completed = json["completed"].boolValue
        tasksAmount = json["tasks_amount"].intValue
        tasksCompleted = json["tasks_completed"].intValue
        hasInvite = json["has_invite"].boolValue
        posterLink = json["image"].stringValue
    }
    
    private func parseRating(json: JSON) -> Quest.Rating {
        let rating = Quest.Rating()
        self.rating.playerPosition = json["rating"]["player_position"].int
        self.rating.total = json["rating"]["total"].intValue
        return rating
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
    
    private func parseStatus(json: JSON) -> StatusObject {
        var status = Parse.shared.parseStatus(input: json["status"].stringValue)
        if let dateStart = json["active_from"].stringValue.toDate(.isoDateTimeSec) {
            if dateStart > Date() { status = .blocked }
        }
        return status
    }
    
    private func parseOptionalDate(input: String?) -> Date? {
        return input == nil ? nil : input!.toDate(.isoDateTimeSec)
    }
}
