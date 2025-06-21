import SwiftUI

struct WidgetCell: View {
    
    @State private var viewModel = ViewModel()
    
    init(widget: Widget) {
        viewModel.widget = widget
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
        .frame(width: UIScreen.main.bounds.width - 16)
        .frame(height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay{
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    IconMode(type: viewModel.widget.objectType)
                    TitleMode(type: viewModel.widget.objectType)
                    Spacer()
                }
                Text(viewModel.widget.objectName)
                    .font(.ptRoot_Bold(size: .size_20))
                    .lineLimit(3)
                    .foregroundStyle(AppTheme.BB_TextHigh)
                Spacer()
            }
            .padding(8)
        }
    }
}


extension WidgetCell {
    
    @Observable
    class ViewModel {
        
        var widget: Widget!
        var poster: UIImage = UIImage()
        
        func getPoster() {
            if widget.poster == nil {
                switch widget.objectType {
                case .url:
                    poster = UIImage(named: "widget_link") ?? UIImage()
                case .file:
                    poster = UIImage(named: "widget_file") ?? UIImage()
                case .course, .assignedCourses, .programm:
                    poster = UIImage(named: "widget_course") ?? UIImage()
                case .arenaWin, .arena:
                    poster = UIImage(named: "widget_arena") ?? UIImage()
                case .mountainWin, .mountain:
                    poster = UIImage(named: "widget_mountains") ?? UIImage()
                case .video:
                    poster = UIImage(named: "widget_video") ?? UIImage()
                case .tower:
                    poster = UIImage(named: "widget_tower") ?? UIImage()
                case .article:
                    poster = UIImage(named: "widget_article") ?? UIImage()
                case .event, .eventChain:
                    poster = UIImage(named: "widget_event") ?? UIImage()
                case .quest:
                    poster = UIImage(named: "widget_quest") ?? UIImage()
                case .competition:
                    poster = UIImage(named: "widget_tournament") ?? UIImage()
                case .testing:
                    poster = UIImage(named: "widget_test") ?? UIImage()
                default:
                    break
                }
            } else {
                Task(priority: .userInitiated) {
                    poster = await API.shared._requestImage(link: widget.poster!)
                }
            }
        }
    }
}
