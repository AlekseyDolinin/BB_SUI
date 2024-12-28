import SwiftUICore

struct TitleMode : View {

    var type: TypeObject

    var body: some View {
        setTitle(type)
            .font(.ptRoot_Medium(size: .size_14))
            .foregroundStyle(AppTheme.BB_TextHigh)
    }

    private func setTitle(_ type: TypeObject) -> Text {
        return switch type {
        case .url:
            Text("Ссылка")
//        case .file:
//            let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
//            self.image = UIImage(systemName: "arrow.down.doc.fill", withConfiguration: configuration)
        case .course:
            Text(AppLanguage.shared.dict["course"].stringValue)
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
            Text(AppLanguage.shared.dict["arena"].stringValue)
        case .mountainWin:
            Text(AppLanguage.shared.dict["ascent"].stringValue)
        case .mountain:
            Text(AppLanguage.shared.dict["ascent"].stringValue)
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
            Text(AppLanguage.shared.dict["tower"].stringValue)
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
            Text(AppLanguage.shared.dict["quest"].stringValue)
//        case .competition:
//            self.image = UIImage(named: "competitionIcon")
        case .testing:
            Text(AppLanguage.shared.dict["activities_test_single"].stringValue)
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
//        case .unknown:
//            self.image = UIImage()
        default:
            Text("---")
        }
    }
}
