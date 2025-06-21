import SwiftUI

struct CircleView: View {
    
    var color: Color
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .frame(width: 120, height: 120)
            .blur(radius: 70)
            .opacity(0.9)
    }
}
