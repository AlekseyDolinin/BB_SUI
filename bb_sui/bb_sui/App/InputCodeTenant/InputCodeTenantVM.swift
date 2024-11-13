import SwiftUI

extension InputCodeTenantView {
    
    @Observable
    class ViewModel {
        
        var error: Bool = false
        var textError: String = ""
        var indexSegment = 0
        var code = ""
        
        func sendCode() {
            Task(priority: .userInitiated) {
                let codeTriming = code.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                let link = Endpoint.path(.sendTenantCode(code: codeTriming))
                let response: Response_? = await API.shared._request(link)
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
            print("LoadAppData")
            LoadAppData.shared.getOptionsTenant()
            LoadAppData.shared.getColorShemeTenant()
        }
    }
}
