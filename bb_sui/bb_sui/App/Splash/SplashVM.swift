import SwiftUI

extension SplashView {
    
    class ViewModel: ObservableObject {
        
        @Published var commentText = ""
        @Published var openInputCodeTenant = false
        
        init() {
            getVersionApp()
            if LocalStorage.shared.hostname == "" {
                openInputCodeTenant.toggle()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.getData()
                }
            }
        }
        
        func getVersionApp() {
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
            commentText = "Version \(version as? String ?? "")"
        }
        
        func getData() {
            Task(priority: .userInitiated) {
                DispatchQueue.main.async { self.commentText = "Get options tenant" }
                await getOptionsTenant()
                DispatchQueue.main.async { self.commentText = "Get color sheme" }
                await getColorShemeTenant()
                DispatchQueue.main.async { self.commentText = "Get player data" }
                await getPlayerSelfData()
                DispatchQueue.main.async { self.commentText = "Get game currencies" }
                await getGameCurrencies()
            }
        }
        
        private func getOptionsTenant() async {
            sleep(1)
            let link = Endpoint.path(.getOptionsTenant)
            print("link: \(link)")
            let json = await API.shared._request(link, method: .get, checkError: false)
            if let json = json {
                LocalStorage.shared.optionsTenant = json
            }
        }
        
        private func getColorShemeTenant() async {
            sleep(1)
//            let link = Endpoint.path(.getColorShemeTenant)
//            let json = await API.shared._request(link, needCookie: false, checkError: false)
//            if let json = json {
//                AppTheme.createTheme(json: json)
//            }
        }
        
        func getPlayerSelfData() async {
            sleep(1)
//            let link = Endpoint.path(.getUserData)
//            let json = await API.shared._request(link)
//            if let json = json {
//                LocalStorage.shared.userDataJSON = json
//                let stringOne = "Учетные данные не были предоставлены."
//                let stringTwo = "Authentication credentials were not provided."
//                if json["detail"].stringValue == stringOne || json["detail"].stringValue == stringTwo || UserDefaults.standard.dictionary(forKey: .cookiesKey) == nil {
//                    auth()
//                } else {
//                    LocalStorage.shared.playerSelf = PlayerSelf()
//                    Task(priority: .userInitiated) {
//                        await LocalStorage.shared.playerSelf.parse(json: json)
//                        DispatchQueue.main.async {
//                            GlobalSocket.shared.connect()
//                        }
//                    }
//                }
//            }
        }
        
        private func getGameCurrencies() async {
            sleep(1)
//            let link = Endpoint.path(.getGameCurrencies)
//            let json = await API.shared._request(link)
//            if let json = json {
//                if let raw = json.arrayValue.first {
//                    let currency = Currency()
//                    await currency.parse(json: raw)
//                    LocalStorage.shared.currency = currency
//                }
//            }
        }
    }
}
