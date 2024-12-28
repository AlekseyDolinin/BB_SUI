import SwiftUI
import Voyager

struct StoryView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    @State var finishShowStory: Bool = false
    @State var longPress: Bool = false
    @State var sectionForPresent: Int = 0
    @State var storyIsEnd: Bool = false
    
    var body: some View {
        ZStack {
            StoryPage(section: viewModel.story.sections[sectionForPresent])
            VStack {
                IndicatorPage(
                    finishShowStory: $finishShowStory,
                    sectionForPresent: $sectionForPresent,
                    storyIsEnd: $storyIsEnd,
                    longPress: longPress
                )
                HStack {
                    Spacer()
                    Button(action: {
                        router.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                    .frame(width: 40, height: 40)
                    .font(.ptRoot_Medium(size: .size_24))
                    .foregroundColor(AppTheme.BB_TextHigh)
                    .shadow(radius: 2)
                }
                Spacer()
            }
        }
        .onChange(of: finishShowStory) {
            if finishShowStory == true {
                router.dismiss()
            }
        }
        .onChange(of: storyIsEnd) {
            if storyIsEnd == true {
                router.dismiss()
            }
        }
        .onTapGesture(coordinateSpace: .global) { location in
            if location.x < UIScreen.main.bounds.midX {
                print("<<<<")
            } else {
                print(">>>>")
            }
        }
        .onLongPressGesture(minimumDuration: 0.5) {
            print("Long press detected!")
            longPress = true
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onEnded{ _ in
                    if longPress {
                        longPress = false
                        print("longPress ended")
                    }
                }
        )
    }
}

#Preview {
    StoryView()
}





import SwiftUI
import Voyager

struct IndicatorPage: View {
        
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State var value: Double = 0
    @Binding var finishShowStory: Bool
    @Binding var sectionForPresent: Int
    @Binding var storyIsEnd: Bool
    
    var longPress: Bool
    var story = LocalStorage.shared.selectStory
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary.opacity(0.3)
                .ignoresSafeArea()
            HStack(spacing: 4) {
                ForEach(Array(story.sections.enumerated()), id: \.offset) { index, element in
                    
                    if sectionForPresent == index && value <= 1 {
                        ProgressView(value: value)
                            .tint(.white)
                    } else {
                        ProgressView(value: 0)
                            .tint(.white)
                    }
                }
            }
            .padding(8)
        }
        .frame(height: 12)
        .onReceive(timer) { firedDate in
            if longPress { return }
            if value >= 1 {
                value = 0
                timer.upstream.connect().cancel()
                if LocalStorage.shared.selectStory.sections.count - 1 == sectionForPresent {
                    storyIsEnd = true
                } else {
                    sectionForPresent += 1
                }
            } else {
                value += 0.002
            }
        }
    }
}
