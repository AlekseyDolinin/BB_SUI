import SwiftUI
import Voyager

struct QuestDetail: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    init(id: Int = 0) {
        viewModel.quest.id = id
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
        }
    }
}

#Preview {
    QuestDetail()
}


import SwiftUI

extension QuestDetail {
    
    @Observable
    class ViewModel {
        
        var quest = Quest()
        
    }
}
