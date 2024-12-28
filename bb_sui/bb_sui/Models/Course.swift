import SwiftyJSON
import UIKit

class Course {
    
    var id: Int = 0
    var courseLearningID: Int? = nil
    var name: String = ""
    var description: String = ""
    var poster: UIImage = UIImage(named: "phCourse") ?? UIImage()
    var averageTime: Int = 0
    var createDate: Date? = nil
    var finishDate: Date? = nil
    var activeFrom: Date? = nil
    var activeTo: Date? = nil
    var courseID: Int = 0
    var assignedCourseID: Int? = nil
    var modulesAmount: Int = 0
    var modulesCompleted: Int = 0
    var completionCount: Int = 0
    var learningState: LearningState = .none
    /// массив данных по сертификатам
    var certificates = [CertificateActivity]()
    /// необходимость выполнения пререквезитов
    var hasPrerequisites: Bool = false
    var score: Int = 0
    var currencyCount: Int? = nil
    //
    var assignedAdministrator: Bool = false
    var feedbackShow: Bool = false
    var feedbackExists: Bool = false
    var hint: String = ""
    var feedback = JSON()
    var modules = [Module]()
    
    func openDetail() {
//        DispatchQueue.main.async {
//            let vc = CourseDetailVC(course: self)
//            vc.hidesBottomBarWhenPushed = true
//            GetCurrentVC.get_().navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    func openModule(index: Int) {
//        if self.hasPrerequisites == true {
//            let vc = PrerequisiteListVC(type: .course, id: self.id)
//            GetCurrentVC.get_().presentBottomSheet(vc: vc)
//        } else {
//            showAlertOpenModule(index: index)
//        }
    }
    
    private func showAlertOpenModule(index: Int) {
//        let startTraining = AppLanguage.shared.dict["startTraining"].stringValue
//        let cancel = AppLanguage.shared.dict["cancel"].stringValue
//        let start = AppLanguage.shared.dict["start"].stringValue
//        let nameModule = "\(modules[index].name)"
//        let alert = UIAlertController(title: startTraining, message: nameModule, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: cancel, style: .destructive))
//        alert.addAction(UIAlertAction(title: start, style: .default, handler: { action  in
//            self.modules[index].getLinkModule()
//        }))
//        GetCurrentVC.get_().present(alert, animated: true)
    }
    
    
    enum LearningState {
        case notStarted
        case inProgress
        case none
    }
    
    struct Module {
        var id: Int
        var name: String
        var learningState: LearningState
        var averageTime: Int
        var isLocked: Bool = false
        /// индекс по порядку а списке модулей (для отображения номера модуля на ячейке)
        var indexInList: Int = 0
        
        func getLinkModule() {
            Task(priority: .userInitiated) {
                let link = Endpoint.path(.getLinkModule(moduleID: self.id))
                let json = await API.shared._request(link)
                if let json = json {
                    DispatchQueue.main.async {
//                        let link = json["url"].stringValue
//                        let vc = CourseVC(linkModule: link)
//                        vc.modalPresentationStyle = .fullScreen
//                        GetCurrentVC.get_().present(vc, animated: true)
                    }
                }
            }
        }
    }
}


extension Course {
    
    func parse(json: JSON) async {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        averageTime = json["average_time"].intValue
        createDate = json["create_date"].stringValue.toDate(.isoDateTimeSec)
        finishDate = parseOptionalDate(input: json["finish_date"].string)
        activeFrom = parseOptionalDate(input: json["active_from"].string)
        activeTo = parseOptionalDate(input: json["active_to"].string)
        courseID = json["course_id"].intValue
        assignedCourseID = json["assigned_course_id"].int
        modulesAmount = json["modules_amount"].intValue
        modulesCompleted = json["modules_completed"].intValue
        completionCount = json["completion_count"].intValue
        learningState = parseLearningState(input: json["learning_state"].stringValue)
        certificates = parseCertificates(json: json)
        hasPrerequisites = json["has_uncompleted_prerequisites"].boolValue
        score = json["score"].intValue
        currencyCount = json["currency_count"].int
        assignedAdministrator = json["assigned_administrator"].boolValue
        feedbackShow = json["feedback_show"].boolValue
        feedbackExists = json["feedback_exists"].boolValue
        hint = json["hint"].stringValue
        feedback = json["feedback"]
        modules = await parseModules(json: json["modules"])
        //
        if let posterLink: String = json["image"].string {
            self.poster = await API.shared._requestImage(link: posterLink)
        }
    }
    
    private func parseOptionalDate(input: String?) -> Date? {
        if input == nil {
            return nil
        } else {
            return input!.toDate(.isoDateTimeSec)
        }
    }
    
    private func parseLearningState(input: String) -> Course.LearningState {
        switch input {
        case "not_started":
            return .notStarted
        case "in_progress":
            return .inProgress
        default:
            return .none
        }
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
    
    private func parseModules(json: JSON) async -> [Module] {
        var modules = [Module]()
        for i in 0 ..< json.count {
            let module = Module(id: json[i]["id"].intValue,
                                name: json[i]["name"].stringValue,
                                learningState: parseLearningState(input: json[i]["learning_state"].stringValue),
                                averageTime: json[i]["average_time"].intValue,
                                indexInList: i)
            modules.append(module)
        }
        return modules
    }
}
