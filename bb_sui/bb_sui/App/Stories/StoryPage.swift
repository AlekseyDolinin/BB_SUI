import SwiftUI
import Voyager

struct StoryPage: View {
    
    @EnvironmentObject var router: Router<AppRoute>
        
    let screenBounds = UIScreen.main.bounds
    
    var section: SectionStory
    @State var bgImage = UIImage()
    @State var contentImage = UIImage()
    
    var body: some View {
        ZStack {            
            Color(hex: section.colorBackground)
                .ignoresSafeArea()
            
            if section.backgroundImage != "" {
                GeometryReader { proxy in
                    let ratio = bgImage.size.width / bgImage.size.height
                    let contentMode: ContentMode = ratio < 0.6  ? .fit : .fill
                    Image(uiImage: bgImage)
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .frame(width: screenBounds.width, height: screenBounds.height)
                        .clipped()
                        .ignoresSafeArea()
                }
            }
                        
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    Text(section.title)
                        .font(.ptRoot_Bold(size: .size_30))
                        .foregroundStyle(Color(hex: section.colorText))
                    Text(section.text)
                        .font(.ptRoot_Medium(size: .size_20))
                        .foregroundStyle(Color(hex: section.colorText))
                    if section.image != "" {
                        Image(uiImage: contentImage)
                            .resizable(resizingMode: .stretch)
                            .ignoresSafeArea()
                            .scaledToFit()
                            .cornerRadius(8)
                    }
                    Spacer(minLength: 160)
                }
                .padding(.top, 32)
            }
            .padding(.horizontal)
            
            VStack(spacing: 16) {
                Spacer()
                Button(action: {
                    print("121212")
                }) {
                    Text("Продолжить сеанс")
                }
                .buttonStyle(ButtonFirst())
                
            }
            .padding(.horizontal)
            .padding(.bottom, 32)
        }
        .task(priority: .userInitiated) {
            if section.backgroundImage != "" {
                bgImage = await API.shared._requestImage(link: section.backgroundImage)
            }
            if section.image != "" {
                contentImage = await API.shared._requestImage(link: section.image)
            }
        }
    }
}

#Preview {
    StoryView()
}
