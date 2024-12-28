import SwiftyJSON
import SwiftUI
import Voyager

protocol StateWSDelegate: AnyObject {
    func gwsOpen(_ isOpen: Bool)
    func gwsReciveMessage(json: JSON)
}

final class GSocket: NSObject, ObservableObject {
        
    weak var delegateWSState: StateWSDelegate?
                
    static let shared = GSocket()
    var ws: WebSocket!
    
    func connect() {
        ws = WebSocket()
        print("try connect GWS")
        if let url = URL(string: "wss://\(LocalStorage.shared.hostname)/ws/") {
            var request = URLRequest(url: url)
            API.shared.setCookieInRequest(&request)
            ws = WebSocket(request: request, subProtocols: [])
            ws.services = [.Background]
            ws.delegate = self
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
        delegateWSState?.gwsOpen(true)
    }
    
    func webSocketClose(_ code: Int, reason: String, wasClean: Bool) {
        print("code: \(code)")
        print("reason: \(reason)")
        print("wasClean: \(wasClean)")
    }
    
    func webSocketError(_ error: NSError) {
        print("error: \(error)")
    }
    
    func webSocketMessageText(_ text: String) {
//        print(">>> : \(text)")
        do {
            let json = try JSON(data: text.data(using: .utf8)!)
            delegateWSState?.gwsReciveMessage(json: json)
        } catch let error {
            print("error GS: \(error)")
        }
    }
}
