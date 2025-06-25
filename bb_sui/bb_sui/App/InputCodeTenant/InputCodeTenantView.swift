import SwiftUI
import Voyager

struct InputCodeTenantView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Image("logo_frame")
                        .renderingMode(.template)
                        .foregroundStyle(AppTheme.BB_PrimaryUI)
                    let titleTexts = LocalStrings.shared.titleTexts
                    Text(titleTexts[viewModel.indexSegment])
                        .font(.ptRoot_Regular(size: .size_24))
                        .foregroundStyle(.white)
                        .padding(.top, 32)
                    let placeholderInput = LocalStrings.shared.placeholderInput
                    TextField(placeholderInput[viewModel.indexSegment], text: $viewModel.code)
                        .multilineTextAlignment(.center)
                        .frame(height: 64)
                        .background(.white.opacity(0.1))
                        .tint(.white)
                        .font(.ptRoot_Regular(size: .size_24))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .autocorrectionDisabled()
                        .padding(.horizontal, 16)
                        .colorScheme(.dark)
                        .disabled(viewModel.isLoading)
                    Button(action: {
                        if viewModel.code == "" {
                            viewModel.error = true
                            viewModel.textError = LocalStrings.shared.needEnterCode[viewModel.indexSegment]
                        } else {
                            viewModel.sendCode()
                        }
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .tint(AppTheme.BB_BGPrimary)
                        } else {
                            Text(LocalStrings.shared.titleSendButton[viewModel.indexSegment])
                        }
                    }
                    .padding(.top, 32)
                    .padding(.horizontal)
                    .buttonStyle(ButtonFirst())
                    .opacity(viewModel.code.isEmpty ? 0.25 : 1.0)
                    .disabled(viewModel.isLoading)
                    Spacer(minLength: 100)
                    let comments = LocalStrings.shared.comments
                    Text(comments[viewModel.indexSegment])
                        .font(.ptRoot_Regular(size: .size_16))
                        .foregroundStyle(.gray)
                        .padding(.horizontal, 24)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer(minLength: 24)
                    Picker("", selection: $viewModel.indexSegment) {
                        Text("Ру").tag(0)
                        Text("En").tag(1)
                        Text("Kz").tag(2)
                    }
                    .frame(height: 60)
                    .frame(width: 160)
                    .pickerStyle(.segmented)
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 1.2, height: 1.2))
                    .colorScheme(.dark)
                }
            }
            .scrollDismissesKeyboard(.interactively)
            .padding(.top, 16)
            .background(.black)
            .navigationBarBackButtonHidden(true)
        }
        .sheet(isPresented: $viewModel.presentAuthView) {
            AuthView(urlStr: viewModel.getLinkAuth(), webCallBack: { (authSuccess: Bool?) in
                if authSuccess == true {
                    viewModel.presentAuthView = false
                    router.updateRoot(.splash)
                }
            })
            .ignoresSafeArea(.all)
        }
        .alert(viewModel.textError, isPresented: $viewModel.error) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
    InputCodeTenantView()
}


