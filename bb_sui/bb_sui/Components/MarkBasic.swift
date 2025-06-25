import SwiftUI

struct MarkBasic: View {
    
    var bgColor: Color = AppTheme.BB_BGSecondary.opacity(0.25)
    var textColor: Color = AppTheme.BB_TextHigh
    var nameIcon: String?
    var text: String

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            if let nameIcon = self.nameIcon {
                Image(systemName: nameIcon)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(textColor)
            }
            Text(text)
                .font(.ptRoot(size: .size_14, style: .medium))
                .foregroundStyle(textColor)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(bgColor)
        .clipShape(.capsule)
    }
}

#Preview {
    AccountView()
}
