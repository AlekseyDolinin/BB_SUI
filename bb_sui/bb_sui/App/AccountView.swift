import SwiftUI

struct AccountView: View {
        
    @Binding var presentAccount: Bool
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack(spacing: 0) {
                NavigationBarTwo(presentAccount: $presentAccount)
                NavigationStack {
                    AppTheme.BB_BGPrimary

                }
                .ignoresSafeArea()
            }
        }
    }
}

//#Preview {
//    AccountView()
//}
