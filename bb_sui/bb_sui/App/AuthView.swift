import SwiftUI
import WebKit

struct AuthView: UIViewRepresentable {
    
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        print("makeUIView")
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        print("updateUIView")
        let request = URLRequest(url: url)
        webView.load(request)
        
        _ = webView.observe(\.url, options: .new) { webView, change in
//            if url.absoluteString == LocalStorage.shared.url {
//                self.hideLoader()
//            }
            guard let newValueUrl = change.newValue else { return }
            
            print("!!!! \(newValueUrl?.lastPathComponent)")
            
//            if newValueUrl?.lastPathComponent == "home" {
//                self.showLoader()
//                self.basicWebView.alpha = 0
//                self.saveCookie()
//                // запись hostname после авторизации
//                UserDefaults.standard.set(LocalStorage.shared.hostname, forKey: .hostname)
//            }
        }
    }
    
    
    
    
}

#Preview {
    AuthView(url: URL(string: "https://tinkoff.boxbattle.ru/")!)
        .edgesIgnoringSafeArea(.all)
}
