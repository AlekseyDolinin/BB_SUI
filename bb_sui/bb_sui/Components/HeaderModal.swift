import SwiftUI
import Voyager

struct HeaderModal: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGTertiary
                .ignoresSafeArea()
            HStack {
                Spacer()
                Button(action: {
                    router.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
                .font(.ptRoot_Medium(size: .size_20))
                .foregroundColor(AppTheme.BB_PrimaryUI)
            }
        }
        .frame(height: 40)
    }
}
