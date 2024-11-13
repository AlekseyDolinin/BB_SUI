import SwiftUI

struct InputCodeTenantView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Image("logo_frame")
                        .renderingMode(.template)
                        .foregroundStyle(.yellow)
                    
                    let titleTexts = LocalStrings.shared.titleTexts
                    Text(titleTexts[viewModel.indexSegment])
                        .font(.ptRoot_Regular(size: 24))
                        .foregroundStyle(.white)
                        .padding(.top, 32)
                    
                    let placeholderInput = LocalStrings.shared.placeholderInput
                    TextField(placeholderInput[viewModel.indexSegment], text: $viewModel.code)
                        .multilineTextAlignment(.center)
                        .frame(height: 64)
                        .foregroundStyle(.white)
                        .background(.white.opacity(0.1))
                        .tint(.white)
                        .font(.ptRoot_Regular(size: 24))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .autocorrectionDisabled()
                        .padding(.horizontal, 16)
                    
                    Button(action: {
                        let needEnterCode = LocalStrings.shared.needEnterCode
                        if viewModel.code == "" {
                            viewModel.error = true
                            viewModel.textError = needEnterCode[viewModel.indexSegment]
                        } else {
                            viewModel.sendCode()
                        }
                    }) {
                        let titleSendButton = LocalStrings.shared.titleSendButton
                        Text(titleSendButton[viewModel.indexSegment])
                            .font(.ptRoot_Regular(size: 16))
                    }
                    .padding(.top, 32)
                    .buttonStyle(ButtonFirst())
                    .opacity(viewModel.code.isEmpty ? 0.25 : 1.0)
                    
                    Spacer(minLength: 100)
                    
                    let comments = LocalStrings.shared.comments
                    Text(comments[viewModel.indexSegment])
                        .font(.ptRoot_Regular(size: 16))
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
                }
            }
            .scrollDismissesKeyboard(.interactively)
            .padding(.top, 16)
            .background(.black)
            .navigationBarBackButtonHidden(true)
        }
        .alert(viewModel.textError, isPresented: $viewModel.error) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
    InputCodeTenantView()
}
