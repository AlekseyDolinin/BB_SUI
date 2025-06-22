import SwiftUI

struct MarkBasic: View {
    
    var bgColor: Color
    var textColor: Color
    var nameIcon: String
    var text: String

    var body: some View {
        Label(text, systemImage: nameIcon)
            .font(.ptRoot_Bold(size: .size_12))
            .foregroundStyle(textColor)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(bgColor)
            .clipShape(.capsule)
    }
}
