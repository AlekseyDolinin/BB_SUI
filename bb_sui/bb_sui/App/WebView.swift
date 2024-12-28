import SwiftUI
import WebKit

struct WebView: View {
    
    private var urlStr = ""
    
    init(urlStr: String) {
        self.urlStr = urlStr
        print("urlStr: \(urlStr)")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderModal()
            WebView_(url: URL(string: urlStr)!)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WebView_: UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        let request = URLRequest(url: url)
        wkwebView.load(request)
        return wkwebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
