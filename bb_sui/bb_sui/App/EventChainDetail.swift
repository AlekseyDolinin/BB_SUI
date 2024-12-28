import SwiftUI
import Voyager

struct EventChainDetail: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    init(id: Int = 0) {
        viewModel.eventChain.id = id
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
        }
    }
}

#Preview {
    EventChainDetail()
}


import SwiftUI

extension EventChainDetail {
    
    @Observable
    class ViewModel {
        
        var eventChain = EventsChain()
        
    }
}
