
class LoadAppData {
    
    static let shared = LoadAppData()
    
//    func getOptionsTenant() {
//        Task(priority: .userInitiated) {
//            let link = Endpoint.path(.getOptionsTenant)
//            let response = await API.shared._request(link)
//            if let json = response?.json {
//                print(json)
//                LocalStorage.shared.optionsTenant = json
//            }
//        }
//    }
//    
//    func getColorShemeTenant() {
//        Task(priority: .userInitiated) {
//            let link = Endpoint.path(.getColorShemeTenant)
//            let response = await API.shared._request(link)
//            if let json = response?.json {
//                AppTheme.shared.themeJSON = json
//            }
//        }
//    }
    
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
//        let link = Endpoint.path(.getGameCurrencies)
//        let json = await API.shared._request(link)
//        if let json = json {
//            if let raw = json.arrayValue.first {
//                let currency = Currency()
//                await currency.parse(json: raw)
//                LocalStorage.shared.currency = currency
//            }
//        }
    }
}
