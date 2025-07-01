import SwiftUI

struct ButtonTabSelect: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundColor(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(AppTheme.BB_TextHigh, lineWidth: 1)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 1)
            )
    }
}

struct ButtonTabDeselect: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundColor(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(AppTheme.BB_TextHigh, lineWidth: 0)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 1)
            )
    }
}
