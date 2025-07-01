import SwiftUI

struct ButtonSecond: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 48)
            .foregroundColor(AppTheme.BB_TextHigh)
            .background(AppTheme.BB_BGSecondary.opacity(0.5))
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
