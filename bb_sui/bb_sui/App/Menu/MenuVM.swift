import SwiftUI

extension MenuView {
    
    @Observable
    class ViewModel {
        
        var isPresentAlertLogout = false
        
        var tagSegment: String = AppLanguage.shared.language {
            didSet {
                AppLanguage.shared.language = tagSegment
                AppLanguage.shared.changeLanguageFromMenuApp()
            }
        }
        
        func getCodeTenant() -> String {
            return UserDefaults.standard.string(forKey: .codeTenant) ?? ""
        }
        
        func getLinkAboutApp() -> String {
            if AppLanguage.shared.language == "ru-RU" {
                return "https://boxbattle.ru"
            } else {
                return "https://boxbattle.net"
            }
        }
    }
}
