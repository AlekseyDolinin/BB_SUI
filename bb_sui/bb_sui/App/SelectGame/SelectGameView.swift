import SwiftUI
import Voyager

struct SelectGameView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    
    @State private var viewModel = ViewModel()
    @State private var leftTap: Bool = false
    @State private var rightTap: Bool = false
    
    let widthScreen: CGFloat = UIScreen.main.bounds.width
    let cardPadding: CGFloat = 40
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarForTabbar()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            ContainerTop()
                        }
                        .padding(.top, 2)
                        .padding(.horizontal, 8)
                        
                        ScrollViewReader { value in
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(alignment: .center, spacing: 4) {
                                    ForEach(viewModel.modes, id: \.id) { mode in
                                        GameCardCell(typeGame: mode)
                                            .clipped()
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .padding(.top, -100)
                            .scrollTargetBehavior(.viewAligned)
                            .safeAreaPadding(.horizontal, cardPadding)
                            .onChange(of: viewModel.indexSelectGame, {
                                withAnimation {
                                    value.scrollTo(viewModel.indexSelectGame, anchor: .center)
                                }
                            })
                            .onScrollPhaseChange { oldPhase, newPhase, context in
                                if newPhase == .idle {
                                    viewModel.selectGame(context: context)
                                }
                            }
                        }
                        
                        // bottom controls
                        BottomControlView(
                            tapLeftArrow: $leftTap,
                            tapRightArrow: $rightTap,
                            typeGame: viewModel.modes[viewModel.indexSelectGame]
                        )
                        .frame(height: 100)
                        .padding(.top, -70)
                        
                        Spacer()
                    }
                }
            }
        }
        .onChange(of: leftTap) {
            viewModel.pagingLeft()
        }
        .onChange(of: rightTap) {
            viewModel.pagingRight()
        }
    }
}

#Preview {
    SelectGameView()
}
