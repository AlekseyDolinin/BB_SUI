import SwiftUI
import Voyager

struct TopAccountContainer: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    
    var body: some View {
        ZStack {
            AppTheme.Surface_BB_00db
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    let link = LocalStorage.shared.userDataJSON["avatar"].string ?? ""
                    AsyncImage(url: GetURL.shared.get(link: link)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ZStack{
                            AppTheme.BB_BGSecondary.opacity(0.1)
                            ProgressView()
                        }
                    }
                    .frame(width: 107, height: 107)
                    .cornerRadius(8)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(LocalStorage.shared.userDataJSON["display_name"].string ?? "display_name")
                            .font(.ptRoot_Regular(size: .size_14))
                            .foregroundStyle(AppTheme.BB_TextMedium)
                        let userName = GetFullNameUser.shared.get(
                            surName: LocalStorage.shared.userDataJSON["surname"].stringValue,
                            middleName: LocalStorage.shared.userDataJSON["middle_name"].stringValue,
                            name: LocalStorage.shared.userDataJSON["name"].stringValue
                        )
                        Text(userName)
                            .font(.ptRoot_Bold(size: .size_18))
                            .lineLimit(0)
                            .foregroundStyle(AppTheme.BB_TextHigh)
                    }
                    UserInfoContainer()
                    FlowHStack {
                        ForEach(getTags(), id: \.self) { text in
                            MarkBasic(
                                text: text
                            )
                        }
                    }
                    IMentorContainer()
                    AchivementsContainer()
                    LevelContainer()
                }
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        }
        .cornerRadius(8)
        .clipped()
        .onAppear() {
            print(LocalStorage.shared.userDataJSON)
        }
    }
    
    private func getTags() -> [String] {
        return ["Lorem", "ipsum", "dolor"]
    }
}

#Preview {
    AccountView()
}
