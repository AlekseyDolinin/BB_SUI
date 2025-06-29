import SwiftUI

struct CharacteristicsContainer: View {
        
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Характеристики")
                    .font(.ptRoot(size: .size_24, style: .bold))
                    .foregroundStyle(AppTheme.BB_TextSecondary)
                ForEach(["1", "2", "3"], id: \.self) { chr in
                    ChrContainer(name: "1111111", value: 50)
                }
                Text("Все характеристики")
                    .foregroundStyle(AppTheme.BB_TextHigh)
                    .font(.ptRoot(size: .size_16, style: .regular))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 48)
                    .background(AppTheme.BB_BGSecondary.opacity(0.5))
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    AccountView()
}
