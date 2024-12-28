import SwiftUI
import Voyager

struct TestingDetail: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    init(id: Int = 0) {
        viewModel.testing.id = id
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
        }
    }
}

#Preview {
    TestingDetail()
}


import SwiftUI

extension TestingDetail {
    
    @Observable
    class ViewModel {
        
        var testing = Testing()
        
    }
}
