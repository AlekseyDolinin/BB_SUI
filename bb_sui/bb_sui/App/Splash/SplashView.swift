import SwiftUI

struct SplashView: View {
    
    @State private var viewModel = ViewModel()
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Spacer()
                    Image("logo_frame")
                        .renderingMode(.template)
                        .foregroundStyle(AppTheme.BB_PrimaryUI)
                    Spacer()
                    ProgressView()
                        .tint(.white)
                        .controlSize(.regular)
                    Spacer()
                    Text(viewModel.commentText)
                        .foregroundStyle(.gray)
                        .font(.ptRoot_Regular(size: 12))
                }
            }
            .navigationDestination(isPresented: $viewModel.presentInputCodeTenant) {
                InputCodeTenantView()
            }
            .navigationDestination(isPresented: $viewModel.presentHomeView) {
                TabbarView()
                    .navigationBarBackButtonHidden(true)
            }
            .onAppear {
                viewModel.initVM()
            }
        }
    }
}

#Preview {
    SplashView()
}
