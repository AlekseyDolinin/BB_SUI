import SwiftUI
import Voyager

struct AnotherDeviceLoginView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                Image("diconnect_img")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, 80)
                Text("Заходишь с другого устройства?")
                    .font(.ptRoot(size: .size_20, style: .bold))
                    .foregroundStyle(AppTheme.BB_TextHigh)
                    .padding(.top, 40)
                Text("Сессия на этом устройстве прервана")
                    .font(.ptRoot(size: .size_16, style: .regular))
                    .foregroundStyle(AppTheme.BB_TextHigh)
                    .padding(.top, 16)
                Spacer()
                Button(action: {
                    GSocket.shared.connect()
                    router.dismiss()
                }) {
                    Text("Продолжить сеанс")
                }
                .buttonStyle(ButtonFirst())
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    AnotherDeviceLoginView()
}
