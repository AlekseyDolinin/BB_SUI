import SwiftUI
import Voyager

struct ContainerUserInfo: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.Surface_BB_00db
                .ignoresSafeArea()
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    if let jobposition = LocalStorage.shared.userDataJSON["official_position"].string {
                        Text(jobposition)
                            .font(.ptRoot_Bold(size: .size_14))
                            .foregroundStyle(AppTheme.BB_TextHigh)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(AppTheme.BB_BGSecondary.opacity(0.3))
                            .clipShape(.capsule)
                    }
                    MarkBasic(
                        bgColor: AppTheme.BB_Warning.opacity(0.3),
                        textColor: AppTheme.BB_TextHigh,
                        nameIcon: "info.circle.fill",
                        text: "STATUS"
                    )
                    if LocalStorage.shared.userDataJSON["email"].stringValue != "" {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Почта")
                                .font(.ptRoot_Medium(size: .size_12))
                                .foregroundStyle(AppTheme.BB_TextDisabled)
                            Text(LocalStorage.shared.userDataJSON["email"].stringValue )
                                .font(.ptRoot(size: .size_14, style: .bold))
                                .foregroundStyle(AppTheme.BB_TextDisabled)
                        }
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Телефон")
                            .font(.ptRoot_Medium(size: .size_12))
                            .foregroundStyle(AppTheme.BB_TextDisabled)
                        Text(LocalStorage.shared.userDataJSON["phone"].string ?? "Телефон не указан")
                            .font(.ptRoot(size: .size_14, style: .bold))
                            .foregroundStyle(AppTheme.BB_TextDisabled)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Корпоративный телефон")
                            .font(.ptRoot_Medium(size: .size_12))
                            .foregroundStyle(AppTheme.BB_TextDisabled)
                        Text(LocalStorage.shared.userDataJSON["phone"].string ?? "Корпоративный телефон не указан")
                            .font(.ptRoot(size: .size_14, style: .bold))
                            .foregroundStyle(AppTheme.BB_TextDisabled)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Руководитель")
                            .font(.ptRoot_Medium(size: .size_12))
                            .foregroundStyle(AppTheme.BB_TextDisabled)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Наставник")
                            .font(.ptRoot_Medium(size: .size_12))
                            .foregroundStyle(AppTheme.BB_TextDisabled)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AccountView()
}
