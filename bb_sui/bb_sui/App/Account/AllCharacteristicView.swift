import SwiftUI

struct AllCharacteristicView: View {
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarOnlyBack()
                ScrollView {
                    ForEach(["1", "2", "3", "4"], id: \.self) { chr in
                        ChrContainer(
                            name: "1111111",
                            value: 50,
                            comment: "Среди худших результатов",
                            description: "На основе 14 вопросов. Всего вопросов в теме: 56"
                        )
                    }
                    .padding(.bottom, 120)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 8)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    AllCharacteristicView()
}
