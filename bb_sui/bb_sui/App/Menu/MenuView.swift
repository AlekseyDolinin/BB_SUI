import SwiftUI
import Voyager

struct MenuView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    private var dict = AppLanguage.shared.dict
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarOnlyBack()
                ScrollView {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 16) {
                                Button(action: {
                                    self.router.present(.notoficationSet)
                                }) {
                                    Text(dict["notifications"].stringValue)
                                        .foregroundStyle(AppTheme.BB_TextHigh)
                                        .font(.ptRoot_Medium(size: .size_20))
                                }
                                .frame(height: 48)
                                Button(action: {
                                    self.router.present(.feedbackApp)
                                }) {
                                    Text(dict["feedbackApplication"].stringValue)
                                        .foregroundStyle(AppTheme.BB_TextHigh)
                                        .font(.ptRoot_Medium(size: .size_20))
                                }
                                .frame(height: 48)
                                Button(action: {
                                    self.router.dismiss()
                                }) {
                                    Text(dict["edit_profile_action"].stringValue)
                                        .foregroundStyle(AppTheme.BB_TextHigh)
                                        .font(.ptRoot_Medium(size: .size_20))
                                }
                                .frame(height: 48)
                                Button(action: {
                                    let link = viewModel.getLinkAboutApp()
                                    router.present(.webView(link: link), option: .popover)
                                }) {
                                    Text(dict["aboutApplication"].stringValue)
                                        .foregroundStyle(AppTheme.BB_TextHigh)
                                        .font(.ptRoot_Medium(size: .size_20))
                                }
                                .frame(height: 48)
                            }
                            Spacer()
                        }
                        .padding(.top, 40)
                        HStack {
                            Picker("", selection: $viewModel.tagSegment) {
                                Text("Ру").tag("ru-RU")
                                Text("En").tag("en-US")
                                Text("Kz").tag("kk-KZ")
                            }
                            .frame(width: 160, height: 60)
                            .pickerStyle(.segmented)
                            .scaledToFit()
                            .colorScheme(.dark)
                            Spacer()
                            Button(action: {
                                self.router.dismiss()
                            }) {
                                Label(
                                    title: {
                                        Text(dict["exit"].stringValue)
                                            .font(.ptRoot_Medium(size: .size_18))
                                    }, icon: {
                                        Image(systemName: "rectangle.portrait.and.arrow.right")
                                            .font(.ptRoot_Medium(size: .size_18))
                                    }
                                )
                                .foregroundStyle(AppTheme.BB_TextHigh)
                            }
                            .frame(height: 48)
                        }
                        .padding(.top, 80)
                        Rectangle()
                            .fill(AppTheme.BB_BGSecondary)
                            .frame(height: 1)
                            .padding(.top, 24)
                        HStack(alignment: .center) {
                            Image("logo_frame")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .foregroundStyle(AppTheme.BB_TextHigh.opacity(0.5))
                                .frame(width: 80, height: 80)
                            VStack(alignment: .leading) {
                                Text("2019 - 2024, © Вовлекай")
                                    .font(.ptRoot_Medium(size: .size_12))
                                Text("Labmedia")
                                    .font(.ptRoot_Medium(size: .size_12))
                                Text(viewModel.getCodeTenant())
                                    .font(.ptRoot_Medium(size: .size_12))
                            }
                            .foregroundStyle(AppTheme.BB_TextHigh)
                            Spacer()
                        }
                        .padding(.top, 24)
                        Spacer()
                    }
                    .padding(24)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear() {
            let appearance = UISegmentedControl.appearance()
            let colorSegmentSelect = UIColor(AppTheme.BB_PrimaryUI)
            let colorTitleSelect = UIColor(AppTheme.BB_BGPrimary)
            let colorTitleNormal = UIColor(AppTheme.BB_TextHigh)
            appearance.selectedSegmentTintColor = colorSegmentSelect
            appearance.setTitleTextAttributes([.foregroundColor: colorTitleSelect], for: .selected)
            appearance.setTitleTextAttributes([.foregroundColor: colorTitleNormal], for: .normal)
        }
    }
}

#Preview {
    MenuView()
}
