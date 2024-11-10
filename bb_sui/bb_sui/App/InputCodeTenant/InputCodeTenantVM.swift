import SwiftUI

final class InputCodeTenantVM: ObservableObject {
    
    @Published var codeTenant = ""
    @Published var indexSegment = 0
    
    func sendCode() {
        print("codeTenant: \(codeTenant)")
    }
}
