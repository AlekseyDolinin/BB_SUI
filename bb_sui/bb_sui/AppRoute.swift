import Voyager
import Combine
import SwiftUI

enum AppRoute: Route {
    case splash
    case inputCodeTenant
    case game
    //
    case account
    case allCharacteristic
    case activities
    case archive
    //
    case globalSearch
    case menu
    case adminPanel
    case webView(link: String)
    case notoficationSet
    case feedbackApp
    case anotherDeviceLoginView
    //
    case quest(id: Int)
    case course(id: Int)
    case event(id: Int)
    case eventChain(id: Int)
    case tower(id: Int)
    case testing(id: Int)
    //
    case selectGame
    case story
    
}

struct ContentView: View {
        
    @StateObject var router = Router<AppRoute>(root: .splash)
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavVoyagerView(router: router) { (route: AppRoute) in
            switch route {
            case .splash:
                SplashView()
            case .inputCodeTenant:
                InputCodeTenantView()
            case .game:
                GameView()
            case .account:
                AccountView()
            case .globalSearch:
                GlobalSearchView()
            case .menu:
                MenuView()
            case .adminPanel:
                AdminPanelView()
            case .webView(let link):
                WebView(urlStr: link)
            case .notoficationSet:
                NotificationSetView()
            case .feedbackApp:
                FeedbackAppView()
            case .anotherDeviceLoginView:
                AnotherDeviceLoginView()
            case .quest(let id):
                QuestDetail(id: id)
            case .course(let id):
                CourseDetail(id: id)
            case .event(let id):
                EventDetail(id: id)
            case .eventChain(let id):
                EventChainDetail(id: id)
            case .tower(let id):
                TowerDetail(id: id)
            case .testing(let id):
                TestingDetail(id: id)
            case .selectGame:
                SelectGameView()
            case .story:
                StoryView()
            case .allCharacteristic:
                AllCharacteristicView()
            case .activities:
                ActivitiesView()
            case .archive:
                ArchiveView()
            }
        }
        .onAppear {
            viewModel.subscribe()
        }
    }
}


extension ContentView {
    
    @Observable
    class ViewModel {
        
        private var cancellables: Set<AnyCancellable> = []
        
        func subscribe() {
            print("subscribe !!!!!!")
            cancellables.removeAll()
            GSocket.shared.$json
                .sink { [weak self] json in
                    if let json = json {
                        print(json)
                        if json["type"] == "disconnect" {
                            print("disconnect !!!!!")
                            
                            self.router.present(.anotherDeviceLoginView, option: .fullscreenCover)
                        }
                    }
                }.store(in: &cancellables)
        }
    }
}
