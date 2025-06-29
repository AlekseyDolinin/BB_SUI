import SwiftUI
import Voyager

struct AccountView: View, Copyable {
        
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarOnlyBack()
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        TopAccountContainer()
                        CustomFieldsContainer()
                        VStack(spacing: 16) {
                            VStack(alignment: .leading) {
                                Text("Общие группы:")
                                    .font(.ptRoot(size: .size_16, style: .medium))
                                    .foregroundStyle(AppTheme.BB_TextSecondary)
                                Text("list groups")
                                    .font(.ptRoot(size: .size_16, style: .medium))
                                    .foregroundStyle(AppTheme.BB_TextDisabled)
                            }
                            VStack(alignment: .leading) {
                                Text("Подразделения:")
                                    .font(.ptRoot(size: .size_16, style: .medium))
                                    .foregroundStyle(AppTheme.BB_TextSecondary)
                                Text("list subdivisions")
                                    .font(.ptRoot(size: .size_16, style: .medium))
                                    .foregroundStyle(AppTheme.BB_TextDisabled)
                            }
                        }
                        .padding(.horizontal, 8)
                        .padding(.top, 16)
                        CharacteristicsContainer()
                            .onTapGesture {
                                router.present(.allCharacteristic)
                            }
                            .padding(.top, 16)
                        VStack(spacing: 8) {
                            Button(action: {
                                print("Активность")
                                router.present(.activities)
                            }) {
                                Text("Активность")
                                    .foregroundStyle(AppTheme.BB_TextHigh)
                                    .font(.ptRoot(size: .size_16, style: .regular))
                            }
                            .buttonStyle(ButtonThird())
                            Button(action: {
                                router.present(.archive)
                            }) {
                                Text("Архив")
                                    .foregroundStyle(AppTheme.BB_TextHigh)
                                    .font(.ptRoot(size: .size_16, style: .regular))
                            }
                            .buttonStyle(ButtonSecond())
                        }
                        .padding(.top, 24)
                    }
                    .padding(.bottom, 120)
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.horizontal, 8)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    AccountView()
}
