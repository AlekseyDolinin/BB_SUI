import SwiftUI

extension StoryView {
    
    @Observable
    class ViewModel {
        
        var story = LocalStorage.shared.selectStory
        
    }
}
