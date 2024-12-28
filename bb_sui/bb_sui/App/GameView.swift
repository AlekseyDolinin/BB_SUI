import SwiftUI
import Voyager

struct GameView: View {
            
    var dict = AppLanguage.shared.dict
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("homeIcon")
                    Text(dict["home"].stringValue)
                }
            SelectGameView()
                .tabItem {
                    Image("gamesIcon")
                    Text(dict["games_and_rewards"].stringValue)
                }
            
            LibraryView()
                .tabItem {
                    Image("libraryIcon")
                    Text(dict["knowledge_base"].stringValue)
                }
        }
        .colorScheme(.dark)
        .accentColor(AppTheme.BB_PrimaryUI)
        .onAppear() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(AppTheme.BB_BGPrimary).withAlphaComponent(0.95)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GameView()
}

