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
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding(.top, 80)
                Text("Заходишь с другого устройства?")
                    .font(.ptRoot_Bold(size: .size_20))
                    .foregroundStyle(AppTheme.BB_TextHigh)
                    .padding(.top, 40)
                Text("Сессия на этом устройстве прервана")
                    .font(.ptRoot_Regular(size: .size_16))
                    .foregroundStyle(AppTheme.BB_TextHigh)
                    .padding(.top, 16)
                Spacer()
            }

            VStack {
                Spacer()
                Button(action: {
                    GSocket.shared.connect()
                    router.dismiss()
                }) {
                    Text("Продолжить сеанс")
                }
                .padding()
                .padding(.bottom, 40)
                .buttonStyle(ButtonFirst())
            }
        }
    }
}

#Preview {
    AnotherDeviceLoginView()
}
