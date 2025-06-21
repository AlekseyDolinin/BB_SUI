import SwiftUI
import Voyager

struct NavigationBarOnlyBack: View {

    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary.opacity(0.95)
                .ignoresSafeArea()
                .frame(height: 48)
            HStack {
                Button(action: {
                    router.dismiss(.navigation)
                }) {
                    Image(systemName: "arrow.left")
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.white)
                        .frame(width: 48, height: 48)
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                }
                .frame(width: 48, height: 48)
                Spacer()
            }
        }
    }
}
