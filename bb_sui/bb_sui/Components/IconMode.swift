import SwiftUICore
import UIKit

struct IconMode : View {

    var type: TypeObject

    var body: some View {
        setIcon(type)
            .resizable()
            .foregroundStyle(AppTheme.BB_TextHigh)
            .aspectRatio(contentMode: .fill)
            .frame(width: 18, height: 18)
    }

    private func setIcon(_ type: TypeObject) -> Image {
        return switch type {
        case .url:
            Image(systemName: "link")
//        case .file:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "arrow.down.doc.fill", withConfiguration: configuration)
        case .course:
//            Image(systemName: "book.fill")
            Image(uiImage: UIImage(named: "libraryIcon") ?? UIImage())
            
            
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "graduationcap.fill", withConfiguration: configuration)
//        case .assignedCourses:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "graduationcap.fill", withConfiguration: configuration)
//        case .programm:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "graduationcap.fill", withConfiguration: configuration)
//        case .arenaWin:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "battleWin")
        case .arena:
            Image(uiImage: UIImage(named: "arenasTabIcon") ?? UIImage())
//        case .mountainWin:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "climbIcon")
        case .mountain:
            Image(uiImage: UIImage(named: "climbIcon") ?? UIImage())
//        case .check:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "highlighter", withConfiguration: configuration)
//        case .video:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "play.fill", withConfiguration: configuration)
//        case .codeWord:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "key.viewfinder", withConfiguration: configuration)
        case .tower:
            Image(uiImage: UIImage(named: "towerIcon") ?? UIImage())
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "towerIcon")
//        case .fb:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "taskIconFB")
//        case .rate:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "taskIconRate")
//        case .article:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "articleIcon")
//        case .event:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "eventIcon")
        case .quest:
            Image(uiImage: UIImage(named: "iconQuestNew") ?? UIImage())
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "iconQuestNew")
//        case .competition:
//            self.image = UIImage(named: "competitionIcon")
//        case .testing:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "app.badge.checkmark.fill", withConfiguration: configuration)
//        case .marathons:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "marathonIcon")
//        case .material:
//            self.image = UIImage()
//        case .task:
//            self.image = UIImage()
//        case .round:
//            self.image = UIImage()
//        case .groups:
//            self.image = UIImage()
//        case .subdivisions:
//            self.image = UIImage()
//        case .users:
//            self.image = UIImage()
//        case .jobposition:
//            self.image = UIImage()
//        case .eventChain:
//            contentMode = .scaleAspectFill
//            self.image = UIImage(named: "seriesEvent")
//        case .expertsEvent:
//            self.image = UIImage()
//        case .departament:
//            self.image = UIImage()
        case .unknown:
            Image(systemName: "questionmark.app.fill")
        default:
            Image(systemName: "questionmark.app.fill")
        }
    }
}
