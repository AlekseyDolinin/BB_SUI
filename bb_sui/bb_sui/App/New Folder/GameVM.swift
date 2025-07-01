import SwiftUI
import SwiftyJSON
import Combine

extension GameView {
    
    @Observable
    class ViewModel {
        
        private var cancellables: Set<AnyCancellable> = []
        
        var presentAnotherDeviceLoginView = false
        
        func subscribe() {
            cancellables.removeAll()
            GSocket.shared.$json
                .sink { [weak self] json in
                    if let json = json {
                        self?.parseMessageGlobalSockeet(json: json)
                    }
                }.store(in: &cancellables)
        }
        
        private func parseMessageGlobalSockeet(json: JSON) {
            switch json["type"] {
            case "disconnect":
                disconnect(json: json)
            default:
                print(">>>>>> MSG_GS")
                print(json)
            }
        }
        
        private func disconnect(json: JSON) {
            if json["data"]["reason"] == "another_device_login" {
                self.presentAnotherDeviceLoginView.toggle()
            }
        }
    }
}
