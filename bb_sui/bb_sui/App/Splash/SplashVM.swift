import SwiftUI

extension SplashView {
    
    @Observable
    class ViewModel {
        
        var commentText = ""
        var presentInputCodeTenant = false
        var presentHomeView = false
        
        func initVM() {
            getVersionApp()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let hostname = UserDefaults.standard.string(forKey: .hostname)
                if hostname == nil {
                    self.presentInputCodeTenant = true
                } else {
                    LocalStorage.shared.hostname = hostname!
                    // LoadAppData
                    self.getOptionsTenant()
                    self.getColorShemeTenant()
                }
            }
        }
        
        private func getVersionApp() {
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
            commentText = "Version \(version as? String ?? "")"
        }
        
        private func getOptionsTenant() {
            Task(priority: .userInitiated) {
                let link = Endpoint.path(.getOptionsTenant)
                let response = await API.shared._request(link)
                if let json = response?.json {
                    LocalStorage.shared.optionsTenant = json
                }
            }
        }
        
        private func getColorShemeTenant() {
            Task(priority: .userInitiated) {
                let link = Endpoint.path(.getColorShemeTenant)
                let response = await API.shared._request(link)
                if let json = response?.json {
                    AppTheme.shared.themeJSON = json
                    await MainActor.run {
                        presentHomeView = true
                    }
                }
            }
        }
    }
}
