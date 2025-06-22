import SwiftyJSON
import SwiftUI
import Voyager

final class GSocket: NSObject, ObservableObject {
                        
    static let shared = GSocket()
    var ws: WebSocket!
    
    @Published var json: JSON?
    @Published var isOpen: Bool?
    
    func connect() {
        ws = WebSocket()
        print("try connect GWS")
        if let url = URL(string: "wss://\(LocalStorage.shared.hostname)/ws/") {
            var request = URLRequest(url: url)
            API.shared.setCookieInRequest(&request)
            ws = WebSocket(request: request, subProtocols: [])
            ws.services = [.Background]
            ws.delegate = self
        } else {
            print("hostname: \(LocalStorage.shared.hostname)")
        }
    }
    
    func send(parameters: [String: Any]) {
        do {
            let jsonData = try JSON(parameters).rawData()
            let text = String(decoding: jsonData, as: UTF8.self)
            ws.send(text: text)
        } catch {
            ErrorAlert.shared.show(detail: "globalSocketError")
            connect()
        }
    }
}


extension GSocket: WebSocketDelegate {
    
    func webSocketOpen() {
        isOpen = true
    }
    
    func webSocketClose(_ code: Int, reason: String, wasClean: Bool) {
        print("code: \(code)")
        print("reason: \(reason)")
        print("wasClean: \(wasClean)")
        isOpen = false
    }
    
    func webSocketError(_ error: NSError) {
        print("error: \(error)")
    }
    
    func webSocketMessageText(_ text: String) {
        do {
            self.json = try JSON(data: text.data(using: .utf8)!)
        } catch let error {
            print("error GS: \(error)")
        }
    }
}
