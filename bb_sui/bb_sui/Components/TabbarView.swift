import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("home")
                    Text("Главная")
                }
            GamesView()
                .tabItem {
                    Image("traning")
                    Text("Игры и награды")
                }
            
            LibraryView()
                .tabItem {
                    Image("libraryTabIcon")
                    Text("База знаний")
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
    }
}

#Preview {
    TabbarView()
}
