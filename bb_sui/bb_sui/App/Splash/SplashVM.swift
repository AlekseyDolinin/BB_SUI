import SwiftUI
import Combine
import SwiftyJSON

extension SplashView {
    
    @Observable
    class ViewModel {
        
        private var cancellables: Set<AnyCancellable> = []
        
        func subscribe() {
            cancellables.removeAll()
            GSocket.shared.$isOpen
                .sink { [weak self] gsIsOpen in
                    if let gsIsOpen = gsIsOpen {
                        self?.gwsOpen(gsIsOpen)
                    }
                }.store(in: &cancellables)
        }
        
        var commentText = ""
        var presentInputCodeTenant = false
        var goToGame = false
        
        func startSetVM() {
            getVersionApp()
            let hostname = UserDefaults.standard.string(forKey: .hostname)
            if hostname == nil {
                self.presentInputCodeTenant = true
            } else {
                LocalStorage.shared.hostname = hostname!
                self.loadAppData()
            }
        }
        
        // LoadAppData
        private func loadAppData() {
            Task {
                await getOptionsTenant()
                await getColorShemeTenant()
                do {
                    try await getPlayerSelfData()
                    await getGuides()
                    await getOnboarding()
                    await getGameCurrencies()
                    GSocket.shared.connect()
                } catch {
                    print("need auth")
                }
            }
        }
        
        private func getVersionApp() {
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
            commentText = "Version \(version as? String ?? "")"
        }
        
        private func getOptionsTenant() async {
            commentText = "Get options tenant"
            let link = Endpoint.path(.getOptionsTenant)
            let response = await API.shared._request(link)
            if let json = response?.json {
                LocalStorage.shared.optionsTenant = json
            }
        }
        
        private func getColorShemeTenant() async {
            commentText = "Get color sheme tenant"
            let link = Endpoint.path(.getColorShemeTenant)
            let response = await API.shared._request(link)
            if let json = response?.json {
                AppTheme.shared.themeJSON = json
            }
        }
        
        private func getPlayerSelfData() async throws {
            commentText = "Get player data"
            let link = Endpoint.path(.getUserData)
            let response = await API.shared._request(link)
            //
            if response?.code == 401 {
                self.presentInputCodeTenant = true
            } else {
                if let json = response?.json {
                    LocalStorage.shared.userDataJSON = json
                    await LocalStorage.shared.playerSelf.parse(json: json)
                }
            }
        }
        
        private func getGuides() async {
            commentText = "Get guides"
            let link = Endpoint.path(.getGuides)
            let response = await API.shared._request(link)
            if let json = response?.json {
                LocalStorage.shared.guideRequired = json["required"].boolValue
                for i in json["guides"].arrayValue {
                    let guide = Guide()
                    guide.parse(json: i)
                    LocalStorage.shared.guides.append(guide)
                }
            }
        }
        
        private func getOnboarding() async {
            commentText = "Get onboarding"
            var pagesOnboarding = [PageOnboarding]()
            let link = Endpoint.path(.getOnboarding)
            let response = await API.shared._request(link)
            if let json = response?.json {
                for i in json["onboards"].arrayValue {
                    let page = PageOnboarding()
                    page.parse(json: i)
                    pagesOnboarding.append(page)
                    pagesOnboarding = pagesOnboarding.sorted(by: {$0.order < $1.order})
                }
                LocalStorage.shared.pagesOnboarding = pagesOnboarding
            }
        }
        
        private func getGameCurrencies() async {
            commentText = "Get game currencies"
            let link = Endpoint.path(.getGameCurrencies)
            let response = await API.shared._request(link)
            if let json = response?.json {
                if let raw = json.arrayValue.first {
                    let currency = Currency()
                    await currency.parse(json: raw)
                    LocalStorage.shared.currency = currency
                }
            }
        }
        
        func gwsOpen(_ isOpen: Bool) {
            ObserverScoket.shared.subscribeGS()
            goToGame = isOpen
            // проверка есть ли запущенные активности (идущие бои)
            GSocket.shared.send(parameters: ["type": "update_player_state"])
            GSocket.shared.send(parameters: ["type": "ready"])
        }
    }
}
