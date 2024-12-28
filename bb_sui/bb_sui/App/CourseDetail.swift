import SwiftUI
import Voyager

struct CourseDetail: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    init(id: Int = 0) {
        viewModel.course.id = id
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
        }
    }
}

#Preview {
    CourseDetail()
}


import SwiftUI

extension CourseDetail {
    
    @Observable
    class ViewModel {
        
        var course = Course()
        
    }
}
