import SwiftUI

extension NotificationSetView {
    
    @Observable
    class ViewModel {
        
        var emailIsEnabled: Bool {
            get {
                return LocalStorage.shared.playerSelf.optionsSubscribeEmail
            }
            set {
                LocalStorage.shared.playerSelf.optionsSubscribeEmail = newValue
                changeEmailNotificationOnBack()
            }
        }
        
        func openPushSetting() {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }
        
        func changeEmailNotificationOnBack() {
            Task(priority: .userInitiated) {
                let player = LocalStorage.shared.playerSelf
                let link = Endpoint.path(.setSubscribe(userID: player.id))
                let parameters: [String: Any] = [
                    "name": player.name,
                    "surname": player.surname,
                    "birthday": player.birthdate,
                    "phone": player.phone,
                    "city_title": player.city,
                    "subscribe_email": player.optionsSubscribeEmail
                ]
                let response = await API.shared._request(link, method: .post, parameters: parameters)
                if let json = response?.json {
                    print("json setSubscribe \(json)")
                }
            }
        }
    }
}
