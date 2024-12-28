import SwiftUI
import Voyager

struct HomeView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
        
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
                            
                            // scroll stories
                            if !viewModel.storiesPinned.isEmpty || !viewModel.storiesBasic.isEmpty {
                                ScrollView(.horizontal) {
                                    LazyHStack(alignment: .center, spacing: 8) {
                                        
                                        // pinned story
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
                                        
                                        // basic story
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
                            //
                            ButtonShowCalendar()
                                .frame(height: 90)
                                .padding(.vertical, 16)
                            
                            // Моё обучение
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
                                HStack(alignment: .center, spacing: 0) {
                                    // plate
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
                                    // line
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
                                    //
                                    Spacer()
                                }
                                .padding(.leading, -8)
                            })
                        })
                        .padding(.horizontal, 8)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
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
                    
                    RecomendContentView()
                        .listRowBackground(Color.clear)
                        .padding(.top, 16)
                        .padding(.horizontal, -8)
                        .listRowSeparator(.hidden)
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
//                RecomendContentView()
//                    .padding(.top, 40)
//                    .padding()
            }
        }
        .task {
            viewModel.getData()
        }
    }
}

#Preview {
    HomeView()
}


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
