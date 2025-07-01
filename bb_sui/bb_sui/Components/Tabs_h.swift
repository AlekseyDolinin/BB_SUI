import SwiftUI

struct Tabs_h: View {
    
    var tabs: [String]
    @Binding var selectIndex: Int
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .center, spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    let lineWidth: CGFloat = selectIndex == index ? 1 : 0
                    Button(action: {
                        selectIndex = index
                        print(tabs[index])
                    }) {
                        Text(tabs[index])
                            .foregroundStyle(AppTheme.BB_TextHigh)
                            .font(.ptRoot(size: .size_16, style: .regular))
                            .padding(.horizontal, 16)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .foregroundColor(.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(AppTheme.BB_TextHigh, lineWidth: lineWidth)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 1)
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
//        .background(.black)
        .frame(height: 40)
    }
}

#Preview {
    LibraryView()
}
