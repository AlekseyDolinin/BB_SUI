import SwiftUI

struct NavigationBarTwo: View {
        
    @Binding var presentAccount: Bool
        
    var body: some View {
        
        ZStack {
            AppTheme.BB_BGPrimary
                .frame(height: 48)
            HStack {
                Button(action: {
                    presentAccount = false
                }) {
                    Image(systemName: "arrow.left").font(.system(size: 20))
                        .tint(.white)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
            .frame(height: 48)
        }
        .frame(height: 48)
    }
}
