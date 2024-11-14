import SwiftUI

struct SplashView: View {
    
    @ObservedObject private var vm = SplashVM()
    
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
                        .foregroundStyle(BB_PrimaryUI)
                    Spacer()
                    ProgressView()
                        .tint(.white)
                        .controlSize(.regular)
                    Spacer()
                    Text(vm.commentText)
                        .foregroundStyle(.gray)
                        .font(.ptRoot_Regular(size: 12))
                }
            }
            .navigationDestination(isPresented: $vm.presentInputCodeTenant) {
                InputCodeTenantView()
            }
            .navigationDestination(isPresented: $vm.presentHomeView) {
                HomeView()
                    .navigationBarBackButtonHidden(true)
            }
            .onAppear {
                self.vm.initVM()
            }
        }
    }
}

#Preview {
    SplashView()
}
