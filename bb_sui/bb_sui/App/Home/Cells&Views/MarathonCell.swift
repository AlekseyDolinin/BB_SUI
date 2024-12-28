import SwiftUI

struct MarathonCell: View {
    
    @State private var viewModel = ViewModel()
    
    init(marathon: Marathon) {
        viewModel.marathon = marathon
        viewModel.getPoster()
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: viewModel.poster)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.5)
                .background(.black)
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .frame(height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay{
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    IconMode(type: .marathons)
                    TitleMode(type: .marathons)
                    Spacer()
                }
                Text(viewModel.marathon.name)
                    .font(.ptRoot_Bold(size: .size_20))
                    .lineLimit(3)
                    .foregroundStyle(AppTheme.BB_TextHigh)
                Spacer()
            }
            .padding(8)
        }
    }
}


extension MarathonCell {
    
    @Observable
    class ViewModel {
        
        var marathon: Marathon!
        var poster: UIImage = UIImage()
        
        func getPoster() {
            if marathon.poster == nil {
                poster = UIImage(named: "unsplashMarathon") ?? UIImage()
            } else {
                Task(priority: .userInitiated) {
                    poster = await API.shared._requestImage(link: marathon.poster!)
                }
            }
        }
    }
}
