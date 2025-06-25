import SwiftUI

struct CustomFieldsContainer: View {
        
    var body: some View {
        ZStack {
            AppTheme.Surface_BB_00db
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 8) {

            }
            .frame(height: 100)
        }
        .cornerRadius(8)
        .clipped()
    }
}

#Preview {
    AccountView()
}
