import SwiftUI
import Voyager

struct AccountView: View, Copyable {
        
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarOnlyBack()
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    AccountView()
}
