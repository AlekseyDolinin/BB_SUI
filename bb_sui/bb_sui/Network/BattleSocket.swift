import Foundation
import SwiftyJSON
import UIKit

//protocol BattleDelegate: AnyObject {
//    func receivedData()
//}

//protocol WindowDelegate: AnyObject {
//    func windowDismiss()
//}

public class BattleSocket: NSObject {
    
    public static let shared = BattleSocket()
    
    enum TypeSocketConnect {
        case battleLocation(link: String)
        case battleTower(link: String)
        case battleCompetition(link: String)
        case spectator(link: String)
    }
    
//
//    weak var delegate: BattleDelegate?
//    weak var delegateWindow: WindowDelegate?
//    
//    var session: URLSession!
//    var webSocketTask: URLSessionWebSocketTask!
    var typeSocketConnect: TypeSocketConnect! {
        didSet {
            if typeSocketConnect != nil {
                connect()
            }
        }
    }
//
//    var tempMessageInGlobalSocket: [String: Any]!
//    
//    @Published var json: JSON!
//    
    ///
    private func connect() {
//        print("connect")
//        if typeSocketConnect == nil { return }
//        session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
//        session.configuration.timeoutIntervalForRequest = 30
//        guard let url = URL(string: getLinkBSocket()) else {
//            print("error url BattleSocket: \(getLinkBSocket())")
//            return
//        }
//        print("url battle: \(url)")
//        var request = URLRequest(url: url)
//        API.shared.setCookieInRequest(&request)
//        webSocketTask = session.webSocketTask(with: request)
//        webSocketTask.resume()
    }
    
    ///
    func getLinkBSocket()  -> String {
         switch typeSocketConnect {
         case .battleLocation(let link):
             return link
//         case .battleTower(let link):
//             return link
         case .battleCompetition(let link):
             return link
         case .spectator(let link):
             return link
         default:
             return ""
         }
     }
//    
//    ///
//    func disconnect() {
//        print("BattleSocket disconnect")
//        self.json = nil
//        DispatchQueue.main.async {
//            self.webSocketTask.cancel(with: .goingAway, reason: nil)
//        }
//    }
//    
//    ///
//    private func connected() {
//        if webSocketTask == nil { return }
//        webSocketTask.receive { result in
//            switch result {
//            case .failure(let error):
//                print("error BS connected: \(error)")
//                self.connect()
//            case .success(let message):
//                switch message {
//                case .string(let text):
//                    self.parseMessage(message: text)
//                case .data(let data):
//                    print("Received binary message: \(data)")
//                @unknown default:
//                    fatalError()
//                }
//            }
//        }
//    }
//    
//    ///
//    private func parseMessage(message: String) {
//        do {
//            self.json = try JSON(data: message.data(using: .utf8)!)
//            NotificationCenter.default.post(name: Notification.Name("BSMessage"), object: self.json)
//            self.delegate?.receivedData()
//            self.connected()
//        } catch let error {
//            print("error BS connected webSocket: \(error)")
//        }
//    }
//    
//    
//    /// отправка сообщения в сокет
//    func send(parameters: [String: Any]) {
//        print("⬆️⬆️⬆️ \(Date()): " + "\(parameters)")
//        do {
//            let jsonData = try JSON(parameters).rawData()
//            let string = String(decoding: jsonData, as: UTF8.self)
//            webSocketTask.send(.string(string)) { error in
//                if error != nil {
//                    // запись не отправленого сообщения
//                    // после соединения сокета - будет отправлено записаное сообщение
//                    self.tempMessageInGlobalSocket = parameters
//                    // если статус игрока не ready - значит разрыв сокета произошел не пользователем
//                    if LocalStorage.shared.playerSelf.state != .ready {
//                        self.connect()
//                    }
//                }
//            }
//        } catch {
//            ErrorAlert.shared.show(detail: "globalSocketError")
//            connect()
//        }
//    }
//}
//
//extension BattleSocket: URLSessionWebSocketDelegate {
//    
//    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
//        print("didOpenWithProtocol")
//        switch typeSocketConnect {
////        case .battleTower:
////            BattleTowerLogic.shared.subscribeDelegate()
//        case .battleLocation:
//            BattleLocationLogic.shared.subscribe()
//        case .battleCompetition:
//            BattleCompetitionLogic.shared.subscribeDelegate()
//        case .spectator:
//            BattleSocket.shared.send(parameters: ["type": "in_activity_board"])
//        default:
//            break
//        }
//        connected()
//    }
//    
//    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
//        print("didClose BS")
//        GlobalSocket.shared.send(parameters: ["type": "ready"])
//        LocalStorage.shared.playerSelf.state = .ready
//        //
//        switch self.typeSocketConnect {
//        case /*.battleTower, */.battleLocation, .battleCompetition:
//            self.closeWindow()
//            self.typeSocketConnect = nil
//            self.json = nil
//            self.session = nil
//            self.webSocketTask = nil
//        default:
//            break
//        }
//    }
//    
//    private func closeWindow() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//            if GetCurrentVC.get_() is LocationDetailVC { return }
//            GetCurrentVC.get_().view.window?.dismiss()
//            // при выходе из боя башни - закрытие окна боя и обновление статуса башни (TowerDetailVC)
//            self.delegateWindow?.windowDismiss()
//        }
//    }
}
