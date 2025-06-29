import SwiftUI
import Voyager

struct ActivitiesView: View, Copyable {
        
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarForTabbar()
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    EventsView()
}
