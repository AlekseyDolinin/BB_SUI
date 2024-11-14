import SwiftUI

struct NavigationBar: View {
        
    @State var presentAccount = false
    @State var presentGuide = false
    @State var presentGlobalSearch = false
    @State var presentAdminPanel = false
    @State var presentMenu = false
    
    var body: some View {
        
        ZStack {
            AppTheme.BB_BGPrimary
                .frame(height: 48)
                        
            HStack {
                HStack {
                    Button(action: {
                        presentAccount = true
                    }) {
                        Image("avatar")
                            .resizable()
                            .clipShape(.circle)
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 48)
                }
                
                Spacer()
                
                HStack(spacing: 0, content: {
                    
                    Button(action: {
                        presentGuide = true
                    }) {
                        Image("guideIcon")
                            .tint(.white)
                    }
                    .frame(width: 48)
                    
                    Button(action: {
                        presentAdminPanel = true
                    }) {
                        Image("adminIcon")
                            .tint(.white)
                    }
                    .frame(width: 48)
                    
                    Button(action: {
                        presentGlobalSearch = true
                    }) {
                        Image(systemName: "magnifyingglass").font(.system(size: 24))
                            .tint(.white)
                    }
                    .frame(width: 48)
                    
                    Button(action: {
                        presentMenu = true
                    }) {
                        Image("menuTabIcon")
                            .frame(width: 24, height: 24)
                            .tint(.white)
                    }
                    .frame(width: 48)
                })
            }
            .padding(.horizontal, 8)
            .frame(height: 48)
            
        }
        .frame(height: 48)
        
        .navigationDestination(isPresented: $presentAccount) {
            AccountView(presentAccount: $presentAccount)
                .navigationBarBackButtonHidden()
        }
        .navigationDestination(isPresented: $presentGuide) {
//            AccountView()
        }
        .navigationDestination(isPresented: $presentAdminPanel) {
            AdminPanelView()
        }
        .navigationDestination(isPresented: $presentGlobalSearch) {
            GlobalSearchView()
        }
        .navigationDestination(isPresented: $presentMenu) {
            MenuView()
        }
    }
}
