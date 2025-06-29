import SwiftUI
import Voyager

struct LibraryView: View {
    
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
                                TitlePrimery(title: "Подборки")
                                ScrollView(.horizontal) {
                                    LazyHStack(alignment: .center, spacing: 8) {
                                        // Подборки

                                    }
                                }
                                .background(.red)
                                .scrollIndicators(.hidden)
                                .background(.clear)
                                .frame(height: 160)
                                .padding(.bottom, 16)
                            })
                            // tabs
                            Rectangle()
                                .frame(height: 48)
                                .foregroundStyle(.green)
                        })
                        .padding(.horizontal, 8)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .scrollClipDisabled(true)
                    
//                    ForEach(viewModel.myLearning, id: \.id) { myLearning in
//                        MyLearningPlateCell(myLearning: myLearning)
//                            .listRowBackground(Color.clear)
//                            .listRowInsets(EdgeInsets())
//                            .listRowSeparator(.hidden)
//                            .padding(.top, 8)
//                            .onTapGesture {
////                                openMyLearning(myLearning)
//                            }
//                    }
//                    .padding(.horizontal, 8)
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

#Preview {
    LibraryView()
}


extension HomeView {
    
    private func openMyLearning(_ myLearning: MyLearning) {
        switch myLearning.type {
        case .quest:
            router.present(.quest(id: myLearning.objectID)) { }
        case .course:
            router.present(.course(id: myLearning.courseLearningID)) { }
        case .event:
            router.present(.event(id: myLearning.objectID)) { }
        case .eventChain:
            router.present(.eventChain(id: myLearning.objectID)) { }
        case .tower:
            router.present(.tower(id: myLearning.objectID)) { }
        case .testing:
            router.present(.testing(id: myLearning.objectID)) { }
        default:
            break
        }
    }
}
