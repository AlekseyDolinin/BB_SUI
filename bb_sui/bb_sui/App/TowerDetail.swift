import SwiftUI
import Voyager

struct TowerDetail: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    init(id: Int = 0) {
        viewModel.tower.id = id
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
        }
    }
}

#Preview {
    TowerDetail()
}


import SwiftUI

extension TowerDetail {
    
    @Observable
    class ViewModel {
        
        var tower: Tower!
        
    }
}
