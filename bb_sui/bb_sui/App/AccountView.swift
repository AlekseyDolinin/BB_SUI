import SwiftUI
import Voyager

struct AccountView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
        
    var btnBack: some View {
        Button(action: {
            self.router.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

#Preview {
    AccountView()
}
