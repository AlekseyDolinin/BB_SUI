import SwiftUI
import SwiftyJSON

struct RecomendContentView: View {
    
    var body: some View {
        ZStack {
            Image("card_12")
                .resizable()
                .background(AppTheme.BB_BGTertiary)
            HStack {
                VStack(alignment: .leading) {
                    Text("Найди полезное обучение \nна свой вкус в базе знаний")
                        .font(.ptRoot_Medium(size: .size_16))
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button(action: {
                        print("presentGuide")
                    }) {
                        Text("Перейти")
                            .font(.ptRoot_Medium(size: .size_16))
                            .foregroundColor(AppTheme.BB_BGPrimary)
                            .padding(.horizontal)
                    }
                    .frame(height: 40)
                    .background(AppTheme.BB_PrimaryUI)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
            }
            .padding(24)


        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


#Preview {
    HomeView()
}
