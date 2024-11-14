import SwiftUI

struct LibraryView: View {
        
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack(spacing: 0) {
                NavigationBar()
                NavigationStack {
                    AppTheme.BB_BGPrimary

                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    LibraryView()
}
