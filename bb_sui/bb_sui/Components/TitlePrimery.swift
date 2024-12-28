import SwiftUI

struct TitlePrimery: View {
        
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(AppTheme.BB_TextHigh)
                .font(.ptRoot_Bold(size: .size_32))
            Spacer()
        }
    }
}

#Preview {
    TitlePrimery(title: "TitlePrimery")
}
