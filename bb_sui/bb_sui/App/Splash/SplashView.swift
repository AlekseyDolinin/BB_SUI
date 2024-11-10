import SwiftUI

struct SplashView: View {
        
    @ObservedObject private var vm = ViewModel()
    
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
                        .foregroundStyle(.yellow)
                    Spacer()
                    ProgressView()
                        .tint(.white)
                        .controlSize(.regular)
                    Spacer()
                    Text(vm.commentText)
                        .foregroundStyle(.gray)
                        .font(.ptRoot_Regular(size: 12))
                }
                .navigationDestination(for: String.self) { $vm.openInputCodeTenant in
                    print("destination: \(vm.openInputCodeTenant)")
//                                if destination == "LoginView" {
//                                    LoginView()
//                                } else {
//                                    RegistrationView()
//                                }
//                            }
//                .navigate(to: MainPageView(), when: $willMoveToNextScreen)
            }
        }.onAppear {
//            vm.$openInputCodeTenant.sink { bool in
//                print("bool: \(bool)")
//                
//            if bool {
//                .navigate(to: InputCodeTenantView, when: bool)
//                } else {
//                    
//                }
////                NavigationLink(destination: InputCodeTenantView()) {
////                    Text("Do Something")
////                }
//            }
        }
    }
    
    private func showInputCodeTenantView() {
        print("showInputCodeTenantView")
//        InputCodeTenantView()
//        vm.commentText = "go to input code tenant"
//        InputCodeTenantView()
//        
//        let lin = NavigationLink("11") {
//            InputCodeTenantView()
//        }
    }
}

#Preview {
    SplashView()
}



//extension View {
//    /// Navigate to a new view.
//    /// - Parameters:
//    ///   - view: View to navigate to.
//    ///   - binding: Only navigates when this condition is `true`.
//    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
//        NavigationView {
//            ZStack {
//                self
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
//
//                NavigationLink(
//                    destination: view
//                        .navigationBarTitle("")
//                        .navigationBarHidden(true),
//                    isActive: binding
//                ) {
//                    EmptyView()
//                }
//            }
//        }
//        .navigationViewStyle(.stack)
//    }
//}
