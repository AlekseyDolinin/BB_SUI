import SwiftUI
import Voyager

struct FeedbackAppView: View {
    
    @EnvironmentObject var router: Router<AppRoute>
    @State private var viewModel = ViewModel()
    
    var btnBack: some View {
        Button(action: {
            self.router.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        ZStack {
            AppTheme.BB_BGPrimary
                .ignoresSafeArea()
            ScrollView {
                TitlePrimery(title: "Обратная связь")
                Spacer()
                
                Picker("", selection: $viewModel.typeFeedback) {
                    Text("Ошибка").tag("error")
                    Text("Улучшение").tag("improvement")
                }
                .pickerStyle(.segmented)
                .colorScheme(.dark)
                .padding(.top, 16)
                
                TextField("Тема обращения", text: $viewModel.theme, axis: .vertical)
                    .padding(12)
                    .background(AppTheme.BB_BGTertiary)
                    .tint(AppTheme.BB_TextHigh)
                    .font(.ptRoot_Regular(size: .size_18))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .colorScheme(.dark)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 24)
                
                TextField("e-mail", text: $viewModel.mail, axis: .vertical)
                    .padding(12)
                    .background(AppTheme.BB_BGTertiary)
                    .tint(AppTheme.BB_TextHigh)
                    .font(.ptRoot_Regular(size: .size_18))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .colorScheme(.dark)
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading) {
                    TextField("Комментарий", text: $viewModel.comment, axis: .vertical)
                        .padding(12)
                        .background(AppTheme.BB_BGTertiary)
                        .tint(AppTheme.BB_TextHigh)
                        .font(.ptRoot_Regular(size: .size_18))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .colorScheme(.dark)
                        .frame(maxWidth: .infinity)
                    
                    Text("10000")
                        .font(.ptRoot_Regular(size: .size_14))
                        .foregroundStyle(AppTheme.BB_TextHigh)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    List {
                        
                    }
                    .frame(height: 60)
                    .padding()
                    
                    Button(action: {
                        print("Нажал кнопку прикрепить файл")
                    }) {
                        HStack {
                            Image(systemName: "paperclip")
                                .font(.headline)
                            
                            Text("Прикрепить файл")
                                .font(.ptRoot_Regular(size: .size_16))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .foregroundStyle(AppTheme.BB_TextHigh)
                        }
                        .frame(height: 48)
                        .foregroundColor(.white)
                    }
                    
                    Text("*Выбраить и прикрепить возможно максимум 5 файлов. Максимальный размер...")
                        .multilineTextAlignment(.leading)
                        .font(.ptRoot_Regular(size: .size_16))
                        .foregroundStyle(AppTheme.BB_TextHigh)
                }
                .background(.brown)
                .padding(.top, 24)
                
                Button(action: {
                    print("SEND")
                }) {
                    Text("Отправить")
                    //                        if viewModel.isLoading {
                    //                            ProgressView()
                    //                                .progressViewStyle(.circular)
                    //                        } else {
                    //                            Text(LocalStrings.shared.titleSendButton[viewModel.indexSegment])
                    //                        }
                }
                .padding(.top, 32)
                .buttonStyle(ButtonFirst())
                //                    .opacity(viewModel.code.isEmpty ? 0.25 : 1.0)
                //                    .disabled(viewModel.isLoading)
                
                .padding(.top, 24)
            }
            .padding()
            .scrollDismissesKeyboard(.interactively)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

#Preview {
    FeedbackAppView()
}
