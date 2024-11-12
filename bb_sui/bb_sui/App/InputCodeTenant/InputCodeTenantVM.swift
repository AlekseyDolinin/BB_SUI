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


class LoadAppData {
    
    static let shared = LoadAppData()
    
    
    //    private func getData() {
    //        Task(priority: .userInitiated) {
    //            DispatchQueue.main.async { self.commentText = "Get options tenant" }
    //            await getOptionsTenant()
    //            DispatchQueue.main.async { self.commentText = "Get color sheme" }
    //            await getColorShemeTenant()
    //            DispatchQueue.main.async { self.commentText = "Get player data" }
    //            await getPlayerSelfData()
    //            DispatchQueue.main.async { self.commentText = "Get game currencies" }
    //            await getGameCurrencies()
    //        }
    //    }

    
    func getOptionsTenant() {
        print("getOptionsTenant")
        Task(priority: .userInitiated) {
            let link = Endpoint.path(.getOptionsTenant)
            let response = await API.shared._request(link)
            if let json = response?.json {
                print(json)
//                LocalStorage.shared.optionsTenant = json
            }
        }
    }
    
    func getColorShemeTenant() {
        print("getColorShemeTenant")
        Task(priority: .userInitiated) {
            let link = Endpoint.path(.getColorShemeTenant)
            let response = await API.shared._request(link)
            if let json = response?.json {
                print(json)
//                AppTheme.createTheme(json: json)
            }
        }
    }
    
    func getPlayerSelfData() async {
//        let link = Endpoint.path(.getUserData)
//        let json = await API.shared._request(link)
//        if let json = json {
//            LocalStorage.shared.userDataJSON = json
//            let stringOne = "Учетные данные не были предоставлены."
//            let stringTwo = "Authentication credentials were not provided."
//            if json["detail"].stringValue == stringOne || json["detail"].stringValue == stringTwo || UserDefaults.standard.dictionary(forKey: .cookiesKey) == nil {
//                auth()
//            } else {
//                LocalStorage.shared.playerSelf = PlayerSelf()
//                Task(priority: .userInitiated) {
//                    await LocalStorage.shared.playerSelf.parse(json: json)
//                    DispatchQueue.main.async {
//                        GlobalSocket.shared.connect()
//                    }
//                }
//            }
//        }
    }
    
    private func getGameCurrencies() async {
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
