import SwiftUI
import Voyager

struct SplashView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
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
            .onChange(of: viewModel.presentInputCodeTenant) {
                router.present(.inputCodeTenant, option: .navigation)
            }
            .onChange(of: viewModel.presentGame) {
                router.present(.game, option: .navigation)
            }
        }
    }
}

#Preview {
    SplashView()
}
