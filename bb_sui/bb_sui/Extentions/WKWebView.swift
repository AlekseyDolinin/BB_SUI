import WebKit

extension WKWebView {
    /// очистка всх Cookies в WebviewAuth
    /// после очистки понадобится аовторная авторизация
    /// если не очистить то при открытии WebviewAuth авторизация происходит автоматически
    /// тк в WebviewAuth сразу редирект на главную страницу
    func cleanAllCookiesInWebviewAuth() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        print("All cookies in webview clear")

        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                print("Cookie ::: \(record) deleted")
            }
        }
    }
}
