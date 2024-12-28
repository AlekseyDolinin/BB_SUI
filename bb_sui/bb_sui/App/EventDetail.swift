import SwiftUI
import Voyager

struct EventDetail: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    init(id: Int = 0) {
        viewModel.event.id = id
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
        }
    }
}

#Preview {
    EventDetail()
}


import SwiftUI

extension EventDetail {
    
    @Observable
    class ViewModel {
        
        var event = EventInCalendar()
        
    }
}
