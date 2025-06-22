import SwiftUI
import Voyager

struct HomeView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    @Binding var tabSelection: Int
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            VStack {
                NavigationBarForTabbar()
                List {
                    Section {
                        VStack(alignment: .leading, spacing: 0, content: {
                            VStack(alignment: .leading, spacing: 8, content: {
                                TitlePrimery(title: viewModel.dict["pay_attention"].stringValue)
                                ScrollView(.horizontal) {
                                    LazyHStack(alignment: .center, spacing: 8) {
                                        // widgets
                                        LazyHStack(alignment: .center, spacing: 8) {
                                            ForEach(viewModel.widgets, id: \.id) { widget in
                                                WidgetCell(widget: widget)
                                            }
                                        }
                                        .padding(.vertical, 8)
                                        
                                        // marathons
                                        LazyHStack(alignment: .center, spacing: 8) {
                                            ForEach(viewModel.marathons, id: \.id) { marathon in
                                                MarathonCell(marathon: marathon)
                                            }
                                        }
                                        .padding(.vertical, 8)
                                    }
                                }
                                .scrollIndicators(.hidden)
                                .background(.clear)
                                .frame(height: 160)
                                .padding(.bottom, 16)
                            })
                            // MARK: - scroll stories
                            if !viewModel.storiesPinned.isEmpty || !viewModel.storiesBasic.isEmpty {
                                ScrollView(.horizontal) {
                                    LazyHStack(alignment: .center, spacing: 8) {
                                        
                                        // MARK: - pinned story
                                        LazyHStack(alignment: .center, spacing: 12) {
                                            ForEach(viewModel.storiesPinned) { story in
                                                StoryPinnedCell(story: story)
                                                    .onTapGesture {
                                                        LocalStorage.shared.selectStory = story
                                                        router.present(.story, option: .fullscreenCover)
//                                                        router.present(.story, option: .popover) {
//                                                            LocalStorage.shared.selectStory.currentSection = 0
//                                                        }
                                                    }
                                            }
                                        }
                                        .padding(10)
                                        .background(AppTheme.BB_BGSecondary)
                                        .cornerRadius(16)
                                        
                                        // MARK: - basic story
                                        LazyHStack(alignment: .center, spacing: 10) {
                                            ForEach(viewModel.storiesBasic, id: \.id) { story in
                                                StoryRowBasic(story: story)
                                                    .onTapGesture {
                                                        LocalStorage.shared.selectStory = story
                                                        router.present(.story, option: .fullscreenCover)
                                                    }
                                            }
                                        }
                                        .padding(8)
                                    }
                                }
                                .scrollIndicators(.hidden)
                                .frame(height: 120)
                            }
                            // MARK: - my learning
                            VStack(alignment: .leading, spacing: 0, content: {
                                HStack {
                                    TitlePrimery(title: "Моё обучение")
                                    Spacer()
                                    Button(action: {
                                        print("filter")
                                    }) {
                                        Image(systemName: "switch.2")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(.white)
                                    .buttonStyle(.borderless)
                                }
                                // MARK: - button select type preview
                                HStack(alignment: .center, spacing: 0) {
                                    // MARK: - plate
                                    Button(action: {
                                        viewModel.typeCellMyLearning = .plate
                                    }) {
                                        Image(systemName: "square.grid.2x2.fill")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    .frame(width: 40, height: 48)
                                    .foregroundColor(.white)
                                    .buttonStyle(.borderless)
                                    .opacity(viewModel.typeCellMyLearning == .plate ? 1 : 0.5)
                                    // MARK: - line
                                    Button(action: {
                                        viewModel.typeCellMyLearning = .line
                                    }) {
                                        Image(systemName: "square.fill.text.grid.1x2")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    .frame(width: 40, height: 48)
                                    .foregroundColor(.white)
                                    .buttonStyle(.borderless)
                                    .opacity(viewModel.typeCellMyLearning == .line ? 1 : 0.5)
                                    Spacer()
                                }
                                .padding(.leading, -8)
                            })
                        })
                        .padding(.horizontal, 8)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listRowBackground(Color.clear)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    .scrollClipDisabled(true)
                    ForEach(viewModel.myLearning, id: \.objectID) { myLearning in
                        if viewModel.typeCellMyLearning == .plate {
                            MyLearningPlateCell(myLearning: myLearning)
                                .listRowBackground(Color.clear)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .padding(.top, 8)
                                .onTapGesture {
                                    openMyLearning(myLearning)
                                }
                        }
                        if viewModel.typeCellMyLearning == .line {
                            MyLearningLineCell(myLearning: myLearning)
                                .listRowBackground(Color.clear)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .padding(.top, 8)
                                .onTapGesture {
                                    openMyLearning(myLearning)
                                }
                        }
                    }
                    .padding(.horizontal, 8)
                    // MARK: - section recomend content view
                    Section {
                        Button(action: {
                            tabSelection = 3
                        }) {
                            RecomendContentView()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listRowInsets(
                        EdgeInsets(
                            top: 0,
                            leading: 8,
                            bottom: 0,
                            trailing: 8
                        )
                    )
                    
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                .safeAreaPadding(
                    EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 100,
                        trailing: 0
                    )
                )
            }
        }
        .task {
            viewModel.getData()
        }
    }
}

//#Preview {
//    HomeView()
//}


extension HomeView {
    
    private func openMyLearning(_ myLearning: MyLearning) {
        switch myLearning.type {
        case .quest:
            router.present(.quest(id: myLearning.objectID), option: .navigation) { }
        case .course:
            router.present(.course(id: myLearning.courseLearningID), option: .navigation) { }
        case .event:
            router.present(.event(id: myLearning.objectID), option: .navigation) { }
        case .eventChain:
            router.present(.eventChain(id: myLearning.objectID), option: .navigation) { }
        case .tower:
            router.present(.tower(id: myLearning.objectID), option: .navigation) { }
        case .testing:
            router.present(.testing(id: myLearning.objectID), option: .navigation) { }
        default:
            break
        }
    }
}
