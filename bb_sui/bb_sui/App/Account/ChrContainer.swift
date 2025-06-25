import SwiftUI

struct ChrContainer: View {
    
    var name: String
    var value: Float
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(name)
                .font(.ptRoot(size: .size_18, style: .medium))
                .foregroundStyle(AppTheme.BB_TextHigh)
                .lineLimit(2)
            VStack(alignment: .leading, spacing: 4) {
                Text("\(Int(value))%")
                    .font(.ptRoot(size: .size_16, style: .medium))
                    .foregroundStyle(AppTheme.BB_TextSecondary)
                ProgressView(value: value / 100.0)
                    .tint(AppTheme.BB_PrimaryUI)
                    .background(AppTheme.BB_TextHigh.opacity(0.4))
            }
        }
        .padding(.all, 16)
        .background(AppTheme.Surface_BB_00db)
        .cornerRadius(8)
    }
}

#Preview {
    ChrContainer(name: "Вообще говоря, SwiftUI построен на Combine.", value: 10)
}
