import Voyager
import SwiftUI

enum AppRoute: Route {
    case splash
    case inputCodeTenant
    case game
}

struct ContentView: View {
    
    @StateObject var router = Router<AppRoute>(root: .splash)
    
    var body: some View {
        NavVoyagerView(router: router) { (route: AppRoute) in
            switch route {
            case .splash:
                SplashView()
            case .inputCodeTenant:
                InputCodeTenantView()
            case .game:
                GameView()
            }
        }
    }
}
