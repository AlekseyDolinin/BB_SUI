import SwiftUI

struct ButtonThird: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .foregroundColor(AppTheme.BB_TextHigh)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(AppTheme.BB_TextDisabled, lineWidth: 1)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 1)
                    .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            )
    }
}
