import SwiftUI
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
                        router.present(.account, option: .navigation)
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
                        router.present(.adminPanel, option: .navigation)
                    }) {
                        Image("adminIcon")
                            .tint(.white)
                    }
                    .frame(width: 48, height: 48)
                    Button(action: {
                        router.present(.globalSearch, option: .navigation)
                    }) {
                        Image(systemName: "magnifyingglass").font(.system(size: 24))
                            .tint(.white)
                    }
                    .frame(width: 48, height: 48)
                    Button(action: {
                        router.present(.menu, option: .navigation)
                    }) {
                        Image("menuIcon")
                            .frame(width: 24, height: 24)
                            .tint(.white)
                    }
                    .frame(width: 48, height: 48)
                })
            }
        }
        .onChange(of: viewModel.anotherDeviceLogin) {
            router.present(.anotherDeviceLoginView, option: .fullscreenCover) { }
        }
        .task {
            viewModel.getAvatar()
            viewModel.getOnboarding()
            viewModel.addDelegate()
        }
    }
}


extension NavigationBarForTabbar {
    
    @Observable
    class ViewModel: StateWSDelegate {
        
        var avatar = UIImage(named: "logo_frame")!
        var anotherDeviceLogin = false
        
        func getAvatar() {
            Task(priority: .userInitiated) {
                avatar = await API.shared._requestImage(link: LocalStorage.shared.playerSelf.avatarLink)
            }
        }
        
        func getOnboarding() {
            print("!!!!!! getOnboarding   !!!!!!!")
        }

        func addDelegate() {
            GSocket.shared.delegateWSState = self
        }
        
        func gwsOpen(_ isOpen: Bool) { }
        
        func gwsReciveMessage(json: JSON) {
            switch json["type"] {
            case "disconnect":
                disconnect(json)
            default:
                break
            }
        }
        
        private func disconnect(_ json: JSON) {
            if json["data"]["reason"] == "another_device_login" {
                anotherDeviceLogin.toggle()
            }
        }
    }
}
