import SwiftUI

struct ContainerTop: View {
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(AppLanguage.shared.dict[""].string ?? "Коллекция достижений")
                        .font(.ptRoot_Regular(size: .size_14))
                        .foregroundStyle(AppTheme.BB_TextHigh)
                    Spacer()
                }
                HStack {
                    HStack(alignment: .bottom, spacing: 8) {
                        Text("\(LocalStorage.shared.playerSelf.achievementsCompleted)")
                            .font(.ptRoot_Bold(size: .size_48))
                            .foregroundStyle(AppTheme.BB_TextHigh)
                        Rectangle()
                            .frame(width: 1, height: 32)
                            .foregroundStyle(AppTheme.BB_TextHigh.opacity(0.5))
                            .padding(.bottom, 12)
                        Text("\(LocalStorage.shared.playerSelf.achievementsAll)")
                            .font(.ptRoot_Medium(size: .size_18))
                            .foregroundStyle(AppTheme.BB_TextHigh.opacity(0.5))
                            .padding(.bottom, 8)
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: -16) {
                        ForEach(LocalStorage.shared.playerSelf.achievements, id: \.imageLink) { ach in
                            AchImgInSelectGames(achievement: ach)
                        }
                    }
                }
            }
            .padding()
            .frame(height: 98)
            .overlay{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(AppTheme.BB_TextDisabled, lineWidth: 1)
            }
            
            VStack(alignment: .center, spacing: 8) {
                Button(action: {
                    print("111")
                }) {
                    Image("cup")
                        .foregroundStyle(AppTheme.BB_TextHigh)
                }
                .frame(width: 64, height: 46)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(AppTheme.BB_TextDisabled, lineWidth: 1)
                }
                
                Button(action: {
                    print("222")
                }) {
                    Image("bb_coin")
                        .foregroundStyle(AppTheme.BB_TextHigh)
                }
                .frame(width: 64, height: 46)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(AppTheme.BB_TextDisabled, lineWidth: 1)
                }
            }
        }
    }
}

#Preview {
    SelectGameView()
}



import SwiftUI

struct AchImgInSelectGames: View {
        
    @State private var viewModel = ViewModel()
    
    init(achievement: Achievement) {
        viewModel.achievement = achievement
        viewModel.getImage()
    }
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.poster)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .background(.black)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 1)
                }
                .shadow(color: .black, radius: 5, x: 0, y: 0)
        }
    }
}



extension AchImgInSelectGames {
    
    @Observable
    class ViewModel {
        
        var achievement: Achievement!
        var poster: UIImage = UIImage()
        
        func getImage() {
            Task(priority: .userInitiated) {
                poster = await API.shared._requestImage(link: achievement.imageLink)
            }
        }
    }
}
