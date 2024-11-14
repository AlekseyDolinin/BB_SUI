import SwiftUI

extension InputCodeTenantView {
    
    @Observable
    class ViewModel {
        
        var error: Bool = false
        var textError: String = ""
        var indexSegment = 0
        var code = ""
        var presentAuthView: Bool = false
        var presentHome: Bool = false
        var isLoading = false

        
        func sendCode() {
            isLoading = true
            Task(priority: .userInitiated) {
                let codeTriming = code.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                let link = Endpoint.path(.sendTenantCode(code: codeTriming))
                let response: Response_? = await API.shared._request(link)
                isLoading = false
                if response?.code == 403 {
                    error.toggle()
                    textError = LocalStrings.shared.tenantNotFound[indexSegment]
                }
                if let domain = response?.json["domain"].string {
                    saveCodeTenant()
                    setDomain(domain: domain)
                }
            }
        }
        
        /// сохранение кода тенанта для отображения в меню
        private func saveCodeTenant() {
            UserDefaults.standard.set(code, forKey: .codeTenant)
        }
        
        private func setDomain(domain: String) {
            LocalStorage.shared.hostname = domain
            // LoadAppData
            getOptionsTenant()
            getColorShemeTenant()
        }
        
        private func getOptionsTenant() {
            Task(priority: .userInitiated) {
                let link = Endpoint.path(.getOptionsTenant)
                let response = await API.shared._request(link)
                if let json = response?.json {
                    LocalStorage.shared.optionsTenant = json
                    presentAuthView = true
                }
            }
        }
        
        private func getColorShemeTenant() {
            Task(priority: .userInitiated) {
                let link = Endpoint.path(.getColorShemeTenant)
                let response = await API.shared._request(link)
                if let json = response?.json {
                    AppTheme.shared.themeJSON = json
                }
            }
        }
        
        func getLinkAuth() -> String {
            switch LocalStorage.shared.optionsTenant["oauth2_custom"].stringValue {
            case "t1":
                return "https://tinkoff.boxbattle.ru/"
            default:
                return LocalStorage.shared.url
            }
        }
    }
}
