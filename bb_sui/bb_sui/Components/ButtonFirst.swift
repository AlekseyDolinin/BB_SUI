import SwiftUI

struct ButtonFirst: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 48)
            .foregroundColor(AppTheme.BB_BGPrimary)
            .background(AppTheme.BB_PrimaryUI)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

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
