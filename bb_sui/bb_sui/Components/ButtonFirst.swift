import SwiftUI

struct ButtonFirst: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 48)
            .foregroundColor(.black)
            .background(AppTheme.BB_PrimaryUI)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
