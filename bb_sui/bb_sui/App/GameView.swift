import SwiftUI
import Voyager

struct GameView: View {
       
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView(tabSelection: $tabSelection)
                .tabItem {
                    Image("homeIcon")
                    Text(AppLanguage.shared.dict["home"].stringValue)
                }
                .tag(1)
            SelectGameView()
                .tabItem {
                    Image("gamesIcon")
                    Text(AppLanguage.shared.dict["games_and_rewards"].stringValue)
                }
                .tag(2)
            LibraryView()
                .tabItem {
                    Image("libraryIcon")
                    Text(AppLanguage.shared.dict["knowledge_base"].stringValue)
                }
                .tag(3)
            EventsView()
                .tabItem {
                    Image("eventTabIcon")
                    Text(AppLanguage.shared.dict["activities_event_multiple"].stringValue)
                }
                .tag(4)
        }
        .navigationBarBackButtonHidden()
        .colorScheme(.dark)
        .accentColor(AppTheme.BB_PrimaryUI)
        .onAppear() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(AppTheme.BB_BGPrimary).withAlphaComponent(0.95)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    GameView()
}

