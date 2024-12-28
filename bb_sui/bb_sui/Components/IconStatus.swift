import SwiftUI
import UIKit

struct IconStatus : View {

    var status: StatusObject

    var body: some View {
        Image(systemName: setIcon(status).name)
            .renderingMode(.template)
            .foregroundColor(setIcon(status).color)
            .fontWeight(setIcon(status).weight)
            .frame(width: 18, height: 18)
    }

    private func setIcon(_ status: StatusObject) -> (name: String, color: Color, weight: Font.Weight)  {
        return switch status {
        case .notStarted:
            ("circle", color: AppTheme.BB_Red, .black)
        case .inProgress:
            ("clock.circle", AppTheme.BB_Warning, .regular)
        case .success:
            ("circle", AppTheme.BB_Red, .regular)
        case .failure:
            ("circle", AppTheme.BB_Red, .regular)
        case .blocked:
            ("circle", AppTheme.BB_Red, .regular)
        case .rewardGained:
            ("circle", AppTheme.BB_Red, .regular)
        case .skipped:
            ("circle", AppTheme.BB_Red, .regular)
        case .completed:
            ("circle", AppTheme.BB_Red, .regular)
        case .new:
            ("circle", AppTheme.BB_Red, .regular)
        case .error:
            ("circle", AppTheme.BB_Red, .regular)
        case .planned:
            ("circle", AppTheme.BB_Red, .regular)
        case .rejected:
            ("circle", AppTheme.BB_Red, .regular)
        case .canceled:
            ("circle", AppTheme.BB_Red, .regular)
        case .none:
            ("circle", AppTheme.BB_Red, .regular)
        }
    }
}


#Preview {
    HomeView()
}
