import SwiftUI
import Voyager

struct ContainerIMentor: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.Surface_BB_00db
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Я - наставник")
                            .font(.ptRoot(size: .size_16, style: .medium))
                            .foregroundStyle(AppTheme.BB_TextHigh)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("5")
                                    .font(.ptRoot(size: .size_20, style: .bold))
                                    .foregroundStyle(AppTheme.BB_TextHigh)
                                Text("сейчас")
                                    .font(.ptRoot(size: .size_12, style: .medium))
                                    .foregroundStyle(AppTheme.BB_TextMedium)
                            }
                            Rectangle()
                                .fill(AppTheme.BB_TextDisabled)
                                .frame(width: 1, height: 40)
                            VStack(alignment: .leading) {
                                Text("15")
                                    .font(.ptRoot(size: .size_20, style: .bold))
                                    .foregroundStyle(AppTheme.BB_TextHigh)
                                Text("всего")
                                    .font(.ptRoot(size: .size_12, style: .medium))
                                    .foregroundStyle(AppTheme.BB_TextMedium)
                            }
                        }
                    }
                    Spacer()
                    Image("mentor_image")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding([.leading], 16)
                Button(action: {
                    print("Выбрать нового подопечного")
                }) {
                    HStack(spacing: 8) {
                        Text("Выбрать нового подопечного")
                            .foregroundStyle(AppTheme.BB_TextHigh)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .resizable()
                            .foregroundStyle(AppTheme.BB_TextHigh)
                            .frame(width: 14, height: 14)
                    }
                    .padding(.horizontal, 16)
                }
                .buttonStyle(ButtonSecond())
            }
        }
        .cornerRadius(8)
    }
}

#Preview {
    AccountView()
}
