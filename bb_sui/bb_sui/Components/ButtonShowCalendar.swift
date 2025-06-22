//import SwiftUI
//
//struct ButtonShowCalendar: View {
//    
//    var body: some View {
//        ZStack {
//            AppTheme.BB_BGSecondary
//            Button(action: {
//                print("Переход в календарь")
//            }) {
//                HStack(alignment: .bottom, spacing: 8) {
//                    Text("25")
//                        .font(.ptRoot_Bold(size: .size_48))
//                        .foregroundColor(.white)
//                    Text("декабря")
//                        .font(.ptRoot_Bold(size: .size_20))
//                        .foregroundColor(.white)
//                        .padding(.bottom, 8)
//                    Spacer()
//                }
//                .padding(.leading, 16)            }
//            HStack(alignment: .bottom, spacing: 8) {
//                Spacer()
////                EmptyEventsToday()
//                HasEventsToday()
//            }
//            .padding(.trailing, 16)
//        }
//        .frame(height: 90)
//        .cornerRadius(16)
//    }
//}
//
//#Preview {
//    HomeView()
//}
//
//
/////
//struct HasEventsToday: View {
//    var body: some View {
//        VStack(alignment: .trailing, spacing: 8) {
//            Text("сегодня")
//                .font(.ptRoot_Medium(size: .size_18))
//                .foregroundColor(.white)
//            HStack {
//                Image(systemName: "pin.circle.fill")
//                    .foregroundStyle(.white)
//                    .frame(width: 16, height: 16)
//                Image(systemName: "pin.circle.fill")
//                    .foregroundStyle(.white)
//                    .frame(width: 16, height: 16)
//                Image(systemName: "pin.circle.fill")
//                    .foregroundStyle(.white)
//                    .frame(width: 16, height: 16)
//                Image(systemName: "pin.circle.fill")
//                    .foregroundStyle(.white)
//                    .frame(width: 16, height: 16)
//                Image(systemName: "pin.circle.fill")
//                    .foregroundStyle(.white)
//                    .frame(width: 16, height: 16)
//                Image(systemName: "pin.circle.fill")
//                    .foregroundStyle(.white)
//                    .frame(width: 16, height: 16)
//            }
//        }
//    }
//}
//
//
/////
//struct EmptyEventsToday: View {
//    var body: some View {
//        Text("мероприятий \nнет")
//            .font(.ptRoot_Medium(size: .size_16))
//            .multilineTextAlignment(.trailing)
//            .padding(.vertical, 8)
//            .foregroundColor(.white)
//    }
//}
