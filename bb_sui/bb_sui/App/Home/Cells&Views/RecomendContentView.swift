import SwiftUI

struct RecomendContentView: View {
    
    var body: some View {
        ZStack {
            Color(AppTheme.BB_BGTertiary)
            Image("card_12")
                .resizable()
            HStack {
                VStack(alignment: .leading) {
                    Text("Найди полезное обучение \nна свой вкус в базе знаний")
                        .font(.ptRoot_Medium(size: .size_16))
                        .foregroundColor(.white)
                    Spacer()
                    Text("Перейти")
                        .font(.ptRoot_Medium(size: .size_16))
                        .foregroundColor(AppTheme.BB_BGPrimary)
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(AppTheme.BB_PrimaryUI)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding(24)
        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


#Preview {
    HomeView()
}
