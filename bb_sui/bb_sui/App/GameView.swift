import SwiftUI

struct GameView: View {
        
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            Text("GAME")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
