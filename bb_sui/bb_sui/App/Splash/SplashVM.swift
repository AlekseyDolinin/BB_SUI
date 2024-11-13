import SwiftUI

final class SplashVM: ObservableObject {
    
    @Published var commentText = ""
    @Published var openInputCodeTenant = false
    
    func initVM() {
        getVersionApp()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if LocalStorage.shared.hostname == "" {
                self.openInputCodeTenant = true
            } else {
                self.getData()
            }
        }
    }
    
    private func getVersionApp() {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        commentText = "Version \(version as? String ?? "")"
    }
    
        private func getData() {
            print("getData")
    //        Task(priority: .userInitiated) {
    //            DispatchQueue.main.async { self.commentText = "Get options tenant" }
    //            await getOptionsTenant()
    //            DispatchQueue.main.async { self.commentText = "Get color sheme" }
    //            await getColorShemeTenant()
    //            DispatchQueue.main.async { self.commentText = "Get player data" }
    //            await getPlayerSelfData()
    //            DispatchQueue.main.async { self.commentText = "Get game currencies" }
    //            await getGameCurrencies()
    //        }
        }
}
