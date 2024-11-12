import SwiftUI

struct ButtonFirst: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 48)
            .foregroundColor(.black)
            .background(.yellow)
            .cornerRadius(8)
            .padding(.horizontal, 16)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
