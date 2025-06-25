import SwiftUI

struct AchivementsContainer: View {
        
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 8) {
                Text("Достижения")
                    .font(.ptRoot(size: .size_16, style: .medium))
                    .foregroundStyle(AppTheme.BB_TextHigh)
                HStack {
                    HStack(alignment: .firstTextBaseline) {
                        Text("63")
                            .font(.ptRoot(size: .size_34, style: .bold))
                            .foregroundStyle(AppTheme.BB_TextHigh)
                        Rectangle()
                            .fill(AppTheme.BB_TextDisabled)
                            .frame(width: 1, height: 28)
                        Text("98")
                            .font(.ptRoot(size: .size_18, style: .regular))
                            .foregroundStyle(AppTheme.BB_TextMedium)
                    }
                    Spacer()
                    HStack {
                        Rectangle()
                            .fill(AppTheme.BB_TextDisabled)
                            .frame(width: 48, height: 48)
                    }
                }
                
            }
            .padding(.all, 16)
        }
        .cornerRadius(8)
    }
}

#Preview {
    AccountView()
}
