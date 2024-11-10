import Foundation
import SwiftyJSON
import UIKit

class ErrorAlert {
    
    static let shared = ErrorAlert()
    
    /// показ алерта ошибки
    func show(detail: String, addBluredBG: Bool = true, needBack: Bool = false) {
        DispatchQueue.main.async {
            let data = self.parse(detail: detail)
            let alert = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
            let actionCloseAlert = UIAlertAction(title: "Закрыть", style: .cancel) { [weak self] _ in
                self?.actionCloseAletError(addBluredBG: addBluredBG, needBack: needBack)
            }
            alert.addAction(actionCloseAlert)
            // скрытие контента
//            if addBluredBG == true { GetCurrentVC.get_().view.addBluredBG() }
            //
//            GetCurrentVC.get_().present(alert, animated: true)
        }
    }
    
    private func actionCloseAletError(addBluredBG: Bool, needBack: Bool = false) {
        DispatchQueue.main.async {
//            GetCurrentVC.get_().hideLoader()
            // удаление BluredBG
//            for i in GetCurrentVC.get_().view.subviews {
//                if i is UIVisualEffectView && addBluredBG == true {
//                    i.removeFromSuperview()
//                }
//            }
//            // возврат на предыдущий экран или скрытие модалки
//            if needBack {
//                if GetCurrentVC.get_().navigationController != nil {
//                    GetCurrentVC.get_().navigationController?.popViewController(animated: true)
//                } else {
//                    GetCurrentVC.get_().dismiss(animated: true)
//                }
//            }
        }
    }
    
    /// парсинг текста ошибки
    private func parse(detail: String) -> (title: String, message: String?) {
               
        print(detail)
        
        switch detail {
            
        case "502":
            return (title: "Ошибка сервера",
                    message: nil)
            
        case "globalSocketError":
            return (title: "Ошибка работы сокета",
                    message: nil)
            
        case "player_is_deleted":
            return (title: "Пользователь удалён",
                    message: nil)
            
        case "Превышен лимит времени на запрос..":
            return (title: "Превышен лимит времени на запрос..",
                    message: "Возможно нестабильное интернет соединение")
            
        case "approved":
            return (title: "Заявка создана",
                    message: nil)
            
        case "on_approval_event":
            return (title: "Заявка уже была создана и ожидает подтверждения",
                    message: nil)
            
        case "400", "404":
            return (title: "Объект не найден",
                    message: "Обратитесь к администратору")
            
        case "tower_not_allowed", "related_object_not_found", "video_is_not_available":
            return (title: gDict["object_unavailable"].stringValue,
                    message: gDict["sendAdmin"].stringValue)
            
        case "player_quest_task_not_found":
            return (title: gDict["error"].stringValue,
                    message: "Запись о прохождении задания игроком отсутствует")
            
        case "incorrect_password", "auth_user_not_found":
            return (title: gDict["authUserNotFound"].stringValue,
                    message: "")
        
        case "user_is_npc":
            return (title: gDict["sendAdmin"].stringValue,
                    message: gDict["user_is_npc"].stringValue)
        
        case "multiple_auth_user":
            return (title: gDict["sendAdmin"].stringValue,
                    message: gDict["multiple_auth_user"].stringValue)
        
        case "banned.Заблокирован администратором":
            return (title: gDict["banned"].stringValue,
                    message: "")
            
        case "account_deleted":
            return (title: gDict["account_deleted"].stringValue,
                    message: "")
            
        case "event_not_found":
            return (title: gDict["event_not_found"].stringValue,
                    message: "Обратитесь к администратору")
            
        case "player_has_not_access":
            return (title: gDict["access_blocked"].stringValue,
                    message: gDict["sendAdmin"].stringValue)
            
        case "invalid_event_status":
            return (title: "Статус мероприятия не позволяет выполнить действие",
                    message: nil)
            
        case "player_not_found":
            return (title: gDict["user_is_not_found"].stringValue,
                    message: nil)
            
        case "request_already_exists":
            return (title: "Активная заявка уже существует",
                    message: nil)
            
        case "requested_player_not_found":
            return (title: "Игрок для создания заявки не найден",
                    message: nil)
            
        case "requested_player_has_not_access":
            return (title: gDict["requested_player_has_not_access"].stringValue,
                    message: nil)
            
        case "invalid_event_request_status":
            return (title: "invalid_event_request_status",
                    message: nil)
            
        case "event_request_not_found":
            return (title: "event_request_not_found",
                    message: nil)
            
        case "location_not_available":
            return (title: gDict["access_restricted"].stringValue,
                    message: "Обратитесь к администратору")
            
        case "errorVideoService":
            return (title: gDict["cant_open_video"].stringValue,
                    message: gDict["file_may_have_been_deleted_from_server"].stringValue)
            
        case "not_valid_mark":
            return (title: gDict["incorrect_assessment"].stringValue,
                    message: nil)
            
        case "course_not_found":
            return (title: gDict["сourse_not_found"].stringValue,
                    message: gDict["course_may_have_been_deleted_administrator"].stringValue)
            
            
        case "player_has_not_permission":
            return (title: "Игрок не имеет доступа (из-за настройки тенанта)",
                    message: nil)
            
        case "file_not_found":
            return (title: gDict["error"].stringValue,
                    message: "Файла нет в запросе")
            
        case "file_extension_is_not_valid":
            return (title: gDict["fileTypeNotSupported"].stringValue,
                    message: gDict["fileFormat"].stringValue)
            
        case "file_too_big":
            return (title: gDict["fileIsBig"].stringValue,
                    message: gDict["maximumFileSize"].stringValue)
            
        case "quest_not_found":
            return (title: "Квест не найден",
                    message: "Обратитесь к администратору")
            
        case "course_is_not_active":
            return (title: "Курс не активен",
                    message: "Обратитесь к администратору")
            
        case "quest_not_active":
            return (title: "Квест не активен",
                    message: "Обратитесь к администратору")
            
        case "tower_not_active":
            return (title: AppLanguage.shared.dict["error_tower_not_active"].stringValue,
                    message: "Обратитесь к администратору")
            
        case "name_is_already_taken":
            return (title: gDict["teamNameTaken"].stringValue,
                    message: nil)
            
        case "has_uncompleted_prerequisites":
            return (title: "Игрок, для которого делается попытка создания заявки, не выполнил пререквезиты",
                    message: nil)
            
        case "tenant_not_found":
            return (title: "Компания не найдена",
                    message: nil)
            
        case "team_is_full":
            return (title: gDict["team_is_full2"].stringValue,
                    message: nil)
            
        case "team_is_not_active":
            return (title: gDict["team_is_blocked"].stringValue,
                    message: nil)
            
        case "team_edit_is_not_available":
            return (title: "Команда временно не может быть отредактирована",
                    message: "Попробуйте повторить позже")
            
        case "status_not_valid":
            return (title: "Ошибка статуса заявки",
                    message: nil)
            
        case "validation_error":
            return (title: "Ошибка введённых данных",
                    message: "Проверьте правильность введённых данных")
            
        case "quest_not_started":
            return (title: gDict["error_quest_not_started"].stringValue,
                    message: nil)
            
        default:
            print("detail error: \(detail)")
            return (title: "Не известная ошибка",
                    message: detail)
        }
    }
//
//
//
//
//    /// алерт с обратным отсчетом
//    private func coolDownEmailChange(json: JSON) {
//        DispatchQueue.main.async {
//            var second = json["wait_time"].intValue / 1000
//            let title = gDict["unable_to_change_team_name"].stringValue
//            let titleAction = gDict["close"].stringValue
//            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: titleAction, style: .default))
//            _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
//                second = second - 1
//                if second <= 0 {
//                    timer.invalidate()
//                    alert.dismiss(animated: true)
//                }
//                let time = Time.secondsToDHMS(seconds: second)
//                let minutes = String(format: "%02d", time.minutes)
//                let seconds = String(format: "%02d", time.seconds)
//                let message = gDict["email_change2"].stringValue
//                alert.message = "\n" + message + "\n" + minutes + ":" + seconds
//            })
//            GetCurrentVC.get_().present(alert, animated: true)
//        }
//    }
    
}
