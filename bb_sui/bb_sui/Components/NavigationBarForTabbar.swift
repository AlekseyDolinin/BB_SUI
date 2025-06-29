import SwiftUI
import Combine
import SwiftyJSON
import Voyager

struct NavigationBarForTabbar: View {

    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary.opacity(0.95)
                .ignoresSafeArea()
                .frame(height: 48)
            HStack {
                HStack {
                    Button(action: {
                        router.present(.account)
                    }) {
                        Image(uiImage: $viewModel.avatar.wrappedValue)
                            .resizable()
                            .clipShape(.circle)
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 48, height: 48)
                    .padding(.leading, 8)
                }
                Spacer()
                HStack(spacing: 0, content: {
                    Button(action: {
                        print("presentGuide")
                    }) {
                        Image("guideIcon")
                            .tint(.white)
                    }
                    .frame(width: 48, height: 48)
                    Button(action: {
                        router.present(.adminPanel)
                    }) {
                        Image("adminIcon")
                            .tint(.white)
                    }
                    .frame(width: 48, height: 48)
                    Button(action: {
                        router.present(.globalSearch)
                    }) {
                        Image(systemName: "magnifyingglass").font(.system(size: 24))
                            .tint(.white)
                    }
                    .frame(width: 48, height: 48)
                    Button(action: {
                        router.present(.menu)
                    }) {
                        Image("menuIcon")
                            .frame(width: 24, height: 24)
                            .tint(.white)
                    }
                    .frame(width: 48, height: 48)
                })
            }
        }
        .task {
            viewModel.getAvatar()
            viewModel.getOnboarding()
        }
    }
}


extension NavigationBarForTabbar {
    
    @Observable
    class ViewModel {
                
        var avatar = UIImage(named: "logo_frame")!
        
        func getAvatar() {
            Task(priority: .userInitiated) {
                avatar = await API.shared._requestImage(link: LocalStorage.shared.playerSelf.avatarLink)
            }
        }
        
        func getOnboarding() {
            print("!!!!!! getOnboarding   !!!!!!!")
        }
    }
}








class ObserverScoket {
    
    @EnvironmentObject var router: Router<AppRoute>
    static let shared = ObserverScoket()
    
    private var cancellables: Set<AnyCancellable> = []
    
    func subscribeGS() {
        print(">>>>>>>> subscribeGS")
        cancellables.removeAll()
        GSocket.shared.$json
            .sink { [weak self] json in
                if let json = json {
                    self?.gwsReciveMessage(json)
                }
            }.store(in: &cancellables)
    }
    
    func gwsReciveMessage(_ json: JSON) {
        switch json["type"] {
        case "disconnect":
            disconnect(json)
        default:
            break
        }
    }
    
    private func disconnect(_ json: JSON) {
        if json["data"]["reason"] == "another_device_login" {
            print("!!!! another_device_login !!!!!!")
//            ContentView.shared.router.present(.anotherDeviceLoginView, option: .fullscreenCover)
        }
    }
}
