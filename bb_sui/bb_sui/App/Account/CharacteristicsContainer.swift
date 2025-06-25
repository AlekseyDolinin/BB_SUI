import SwiftUI
import Voyager

struct CharacteristicsContainer: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Характеристики")
                    .font(.ptRoot(size: .size_24, style: .bold))
                    .foregroundStyle(AppTheme.BB_TextSecondary)
                ForEach(["1", "2", "3"], id: \.self) { chr in
                    ChrContainer(name: "1111111", value: 50)
                }
                Button(action: {
                    print("Все характеристики")
                }) {
                    Text("Все характеристики")
                        .foregroundStyle(AppTheme.BB_TextHigh)
                        .font(.ptRoot(size: .size_16, style: .regular))
                }
                .buttonStyle(ButtonSecond())
            }
        }
    }
}

#Preview {
    AccountView()
}
