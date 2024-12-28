import SwiftUI
import UIKit

struct BottomControlView: View {
        
    @State var size: CGFloat = 0.8
    @State var xPositionLeft: CGFloat = 0
    @State var xPositionRight: CGFloat = 100
    @State var buttonsArrowIsDisable: Bool = false
    
    @Binding var tapLeftArrow: Bool
    @Binding var tapRightArrow: Bool
        
    var typeGame: TypeGame
    
    let widthContainer: CGFloat = 200
    let heightContainer: CGFloat = 100
    let delayButtonsArrow: DispatchTime = {
        return DispatchTime.now() + 0.75
    }()
    
    var animation: Animation {
        Animation
            .easeInOut(duration: 4)
            .repeatForever()
    }
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 0) {
                CircleView(color: typeGame.colors[0])
                    .scaleEffect(size)
                    .position(x: xPositionLeft, y: 50)
                CircleView(color:typeGame.colors[1])
                    .scaleEffect(size)
                    .position(x: xPositionRight, y: 50)
            }
            .opacity(0.5)
            .frame(width: widthContainer, alignment: .center)
            .onAppear() {
                withAnimation(self.animation) { self.size = 1.1 }
                withAnimation(self.animation) { self.xPositionLeft = widthContainer }
                withAnimation(self.animation) { self.xPositionRight = -widthContainer + 100 }
            }
            
            VStack {
                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        if buttonsArrowIsDisable { return }
                        buttonsArrowIsDisable = true
                        tapLeftArrow.toggle()
                        DispatchQueue.main.asyncAfter(deadline: delayButtonsArrow, execute: {
                            buttonsArrowIsDisable = false
                        })
                    }) {
                        Image("arrowLeft")
                            .resizable()
                            .padding(16)
                    }
                    .foregroundColor(AppTheme.BB_TextHigh.opacity(0.75))
                    .frame(width: 64, height: 64)
                    .opacity(typeGame.id == 0 ? 0.2 : 1)

                    Spacer(minLength: 4)
                    
                    Text(typeGame.name)
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundStyle(AppTheme.BB_TextHigh.opacity(0.75))
                    
                    Spacer(minLength: 4)
                    
                    Button(action: {
                        if buttonsArrowIsDisable { return }
                        buttonsArrowIsDisable = true
                        tapRightArrow.toggle()
                        DispatchQueue.main.asyncAfter(deadline: delayButtonsArrow, execute: {
                            buttonsArrowIsDisable = false
                        })
                    }) {
                        Image("arrowRight")
                            .resizable()
                            .padding(16)
                    }
                    .foregroundColor(AppTheme.BB_TextHigh.opacity(0.75))
                    .frame(width: 64, height: 64)
                    .opacity(typeGame.id == 4 ? 0.2 : 1)
                }
                .padding(.horizontal, 8)
                
                HStack(alignment: .center, spacing: 8) {
                    Circle()
                        .foregroundStyle(getColor(0))
                        .frame(width: 8, height: 8)
                    Circle()
                        .foregroundStyle(getColor(1))
                        .frame(width: 8, height: 8)
                    Circle()
                        .foregroundStyle(getColor(2))
                        .frame(width: 8, height: 8)
                    Circle()
                        .foregroundStyle(getColor(3))
                        .frame(width: 8, height: 8)
                    Circle()
                        .foregroundStyle(getColor(4))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
    
    private func getColor(_ index: Int) -> Color {
        typeGame.id == index ? AppTheme.BB_PrimaryUI : AppTheme.BB_TextHigh.opacity(0.75)
    }
}

#Preview {
    SelectGameView()
}
