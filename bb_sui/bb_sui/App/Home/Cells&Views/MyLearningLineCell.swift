import SwiftUI

struct MyLearningLineCell: View {
    
    @State private var viewModel = ViewModel()
    
    init(myLearning: MyLearning) {
        viewModel.myLearning = myLearning
        viewModel.getPoster()
    }
        
    var body: some View {
        ZStack {
            AppTheme.BB_BGSecondary
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    IconMode(type: viewModel.myLearning.type)
                    TitleMode(type: viewModel.myLearning.type)
                    Spacer()
                    IconStatus(status: viewModel.myLearning.status)
                }
                Text(viewModel.myLearning.name)
                    .lineLimit(3)
                    .font(.ptRoot_Bold(size: .size_20))
                    .foregroundStyle(AppTheme.BB_TextHigh)
                HStack(alignment: .center, spacing: 4) {
                    // activeFrom
                    if let activeFrom = viewModel.myLearning.activeFrom {
                        HStack(alignment: .center, spacing: 4) {
                            Text(activeFrom.toFormat(.four))
                                .padding(6)
                                .font(.ptRoot_Medium(size: .size_14))
                                .foregroundStyle(AppTheme.BB_TextHigh)
                                .background(viewModel.getColorBGtiming())
                                .cornerRadius(4)
                            Text(activeFrom.toFormat(.ten))
                                .padding(6)
                                .font(.ptRoot_Medium(size: .size_14))
                                .foregroundStyle(AppTheme.BB_TextHigh)
                                .background(viewModel.getColorBGtiming())
                                .cornerRadius(4)
                        }
                    }
                    // activeTo
                    if let activeTo = viewModel.myLearning.activeTo {
                        Text("-")
                        HStack(alignment: .center, spacing: 4) {
                            Text(activeTo.toFormat(.four))
                                .padding(6)
                                .font(.ptRoot_Medium(size: .size_14))
                                .foregroundStyle(AppTheme.BB_TextHigh)
                                .background(viewModel.getColorBGtiming())
                                .cornerRadius(4)
                            Text(activeTo.toFormat(.ten))
                                .padding(6)
                                .font(.ptRoot_Medium(size: .size_14))
                                .foregroundStyle(AppTheme.BB_TextHigh)
                                .background(viewModel.getColorBGtiming())
                                .cornerRadius(4)
                        }
                    }
                }
            }
            .padding(8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


extension MyLearningLineCell {
    
    @Observable
    class ViewModel {
        
        var myLearning: MyLearning!
        var poster: UIImage = UIImage()
        
        func getPoster() {
            if myLearning.poster == "" {
                switch myLearning.type {
                case .event, .eventChain:
                    poster = UIImage(named: "myLearningEvent") ?? UIImage()
                case .quest:
                    poster = UIImage(named: "myLearningQuest") ?? UIImage()
                case .course:
                    poster = UIImage(named: "myLearningCourse") ?? UIImage()
                case .tower:
                    poster = UIImage(named: "tower cover_castle") ?? UIImage()
                case .testing:
                    poster = UIImage(named: "cover_testing") ?? UIImage()
                default:
                    poster = UIImage(named: "") ?? UIImage()
                }
            } else {
                Task(priority: .userInitiated) {
                    poster = await API.shared._requestImage(link: myLearning.poster)
                }
            }
        }
        
        func getColorBGtiming() -> Color {
            return AppTheme.BB_BGPrimary
        }
    }
}
