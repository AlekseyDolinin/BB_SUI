import SwiftUI

struct LevelContainer: View {
        
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Уровень")
                    .font(.ptRoot(size: .size_16, style: .medium))
                    .foregroundStyle(AppTheme.BB_TextSecondary)
                HStack(alignment: .firstTextBaseline) {
                    HStack(alignment: .firstTextBaseline) {
                        Text("26")
                            .font(.ptRoot(size: .size_34, style: .bold))
                            .foregroundStyle(AppTheme.BB_TextHigh)
                        Rectangle()
                            .fill(AppTheme.BB_TextDisabled)
                            .frame(width: 1, height: 28)
                        Text("50")
                            .font(.ptRoot(size: .size_18, style: .regular))
                            .foregroundStyle(AppTheme.BB_TextMedium)
                    }
                    Spacer(minLength: 40)
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("очков до следующего уровня: 666")
                            .font(.ptRoot(size: .size_12, style: .regular))
                            .foregroundStyle(AppTheme.BB_TextSecondary)
                        ProgressView(value: 0.5)
                            .tint(AppTheme.BB_PrimaryUI)
                            .background(AppTheme.BB_TextHigh.opacity(0.4))
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    AccountView()
}
