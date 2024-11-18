import SwiftUI
import WebKit

typealias WebCallBack = ((Bool?) -> Void)?

class MyWKDelegate: NSObject, WKNavigationDelegate {
    
    private var webCallBack: WebCallBack = nil
    
    init(webCallBack: WebCallBack) {
        self.webCallBack = webCallBack
    }
}


struct WebView: UIViewRepresentable {
    
    private let webView: WKWebView
    private let delegate: MyWKDelegate
    private var webViewURLObserver: NSKeyValueObservation?
    
    internal init(urlStr: String, webCallBack: WebCallBack) {
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: config)
        delegate = MyWKDelegate(webCallBack: webCallBack)
        webView.navigationDelegate = delegate
        webView.cleanAllCookiesInWebviewAuth()
        
        if let url = URL(string: urlStr) {
            webView.load(URLRequest(url: url))
            webViewURLObserver = webView.observe(\.url, options: .new) { [self] webView, change in
                guard let newValueUrl = change.newValue else { return }
                if newValueUrl?.lastPathComponent == "home" {
                    self.saveCookie()
                    // запись hostname после авторизации
                    UserDefaults.standard.set(LocalStorage.shared.hostname, forKey: .hostname)
                    webCallBack?(true)
                }
            }
        }
    }

    func makeUIView(context _: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_: WKWebView, context _: Context) {}
    
    private func saveCookie() {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            for cookie in cookies {
                if cookie.name == "user_id" && cookie.domain == LocalStorage.shared.hostname {
                    var cookieDict = [String : AnyObject]()
                    cookieDict["cookie_dict"] = cookie.properties as AnyObject?
                    // save cookies
                    UserDefaults.standard.set(cookieDict, forKey: .cookiesKey)
                }
            }
        }
    }
}
