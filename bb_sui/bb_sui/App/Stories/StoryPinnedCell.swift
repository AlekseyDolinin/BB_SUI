import SwiftUI
import SwiftyJSON

struct StoryPinnedCell: View {
    
    @State private var viewModel = ViewModel()
        
    init(story: Story) {
        viewModel.story = story
        viewModel.getPoster()
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: viewModel.poster)
                .resizable()
                .opacity(0.5)
                .background(.black)
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(systemName: "pin.circle.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 14, height: 14)
                }
                Spacer()
                Text(viewModel.story.title)
                    .font(.ptRoot_Regular(size: .size_14))
                    .foregroundStyle(.white)
                    .lineLimit(3)
                    .padding(.horizontal, 4)
            }
            .padding(4)
        }
        .frame(width: 100, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            // mark viewed story
            if !viewModel.story.viewed {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(AppTheme.BB_PrimaryUI, lineWidth: 1)
                    .padding(-3)
            }
        }
    }
}


extension StoryPinnedCell {
    
    @Observable
    class ViewModel {
        
        var story: Story!
        var poster: UIImage = UIImage()
        
        func getPoster() {
            Task(priority: .userInitiated) {
                poster = await API.shared._requestImage(link: story.posterLink)
            }
        }
    }
}
