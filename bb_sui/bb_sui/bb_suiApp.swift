import SwiftUI

@main
struct bb_suiApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        print("start app")
        RateManager.shared.incrementCount()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    switch newPhase {
                    case .background:
                        print("ScenePhase: Background from \(oldPhase)")
                    case .inactive:
                        print("ScenePhase: Inactive from \(oldPhase)")
                    case .active:
                        print("ScenePhase: Active/Foreground from \(oldPhase)")
                        checkStateGS()
                    @unknown default:
                        print("ScenePhase: Unknown scene phase \(newPhase) from \(oldPhase)")
                    }
                }
        }
    }
    
    private func checkStateGS() {
        if let gs = GSocket.shared.ws {
            if gs.readyState == .closed {
                GSocket.shared.connect()
            }
        }
    }
}
