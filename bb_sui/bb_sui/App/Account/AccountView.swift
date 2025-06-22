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
                ScrollView {
                    VStack {
                        ContainerTopAccount()
                        ContainerIMentor()
                        ContainerAchivements()
                    }
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.horizontal, 8)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    AccountView()
}
