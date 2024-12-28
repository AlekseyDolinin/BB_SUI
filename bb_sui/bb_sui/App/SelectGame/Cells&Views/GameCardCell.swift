import SwiftUI
import Lottie

struct GameCardCell: View {
    
    @State var sizeBackCircle: CGFloat = 0.5
    
    private let widthScreen: CGFloat = UIScreen.main.bounds.width
    private let cardPadding: CGFloat = 40
    private var typeGame: TypeGame!
    
    init(typeGame: TypeGame) {
        self.typeGame = typeGame
    }
    
    var animation: Animation {
        Animation
            .easeInOut(duration: 2)
            .repeatForever()
    }
    
    var body: some View {
        ZStack {
            CircleView(color: typeGame.colors.first ?? .pink)
                .scaleEffect(sizeBackCircle)
            LottieView(animation: .named(typeGame.nameAnimation))
                .resizable()
                .playing()
                .looping()
                .frame(height: 600)
        }
        .frame(width: widthScreen - cardPadding * 2)
        .frame(height: 600)
        
        .onAppear() {
            withAnimation(self.animation) { self.sizeBackCircle = 0.8 }
        }
    }
}
