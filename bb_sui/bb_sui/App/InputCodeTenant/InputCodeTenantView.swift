import SwiftUI

struct InputCodeTenantView: View {
    
    @State private var vm = InputCodeTenantVM()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
           
                Image("logo_frame")
                    .renderingMode(.template)
                    .foregroundStyle(.yellow)
                    .padding(.top, 32)
                
                Text("Введите код компании")
                    .font(.ptRoot_Regular(size: 24))
                    .foregroundStyle(.white)
                    .padding(.top, 32)
                
                TextField("Код", text: $vm.codeTenant)
                    .multilineTextAlignment(.center)
                    .frame(height: 64)
                    .foregroundStyle(.white)
                    .background(.secondary)
                    .tint(.white)
                    .font(.ptRoot_Regular(size: 24))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 16)
                                
                Button(action: {
                    vm.sendCode()
                }) {
                    Text("Отправить")
                        .font(.ptRoot_Regular(size: 16))
                }
                .padding(.top, 32)
                .buttonStyle(ButtonFirst())
                
//                .opacity(0.5)
//                .disabled(true)
                .opacity($vm.codeTenant.wrappedValue == "" ? 0.25 : 1.0)
//                .disabled($vm.codeTenant.isEmpty ? false : true)
                
                Text("Для работы приложения требуется подключение к сети интернет")
                    .font(.ptRoot_Regular(size: 16))
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 16)
                    .padding(.top, 32)
                    .multilineTextAlignment(.center)
                
                Spacer()

                Picker(selection: $vm.indexSegment, label: Text("test")) {
                    Text("Ру").tag(0)
                    Text("En").tag(1)
                    Text("Kz").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 140)
                .tint(.white)
                .colorInvert()
                .colorMultiply(.yellow)
                .background(.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 32)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    InputCodeTenantView()
}



struct ButtonFirst: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 48)
            .foregroundColor(.black)
            .background(.yellow)
            .cornerRadius(8)
            .padding(.horizontal, 16)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
