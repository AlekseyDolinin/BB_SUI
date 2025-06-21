import SwiftUI
import Voyager

struct NotificationSetView: View {
        
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarOnlyBack()
                ScrollView {
                    TitlePrimery(title: "Уведомления")
                    Spacer(minLength: 40)
                    VStack(alignment: .leading) {
                        Toggle("Включить e-mail уведомления", isOn: $viewModel.emailIsEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: AppTheme.BB_PrimaryUI))
                            .foregroundStyle(AppTheme.BB_TextHigh)
                            .font(.ptRoot_Regular(size: .size_16))
                            .padding(.trailing, 4)
                        Rectangle()
                            .fill(AppTheme.BB_BGSecondary)
                            .frame(height: 1)
                            .padding(.top, 24)
                        Button {
                            viewModel.openPushSetting()
                        } label: {
                            Text("Настройка push-уведомлений")
                                .foregroundStyle(AppTheme.BB_TextHigh)
                                .font(.ptRoot_Regular(size: .size_16))
                        }
                        .padding(.top, 24)
                        .frame(height: 48)
                    }
                }
                .clipped(antialiased: false)
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NotificationSetView()
}
