import SwiftUI

@main
struct bb_suiApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    switch newPhase {
                    case .background:
                        print("SchenePhase: Background from \(oldPhase)")
                    case .inactive:
                        print("SchenePhase: Inactive from \(oldPhase)")
                    case .active:
                        print("SchenePhase: Active/Foreground from \(oldPhase)")
                    @unknown default:
                        print("SchenePhase: Unknown scene phase \(newPhase) from \(oldPhase)")
                    }
                }
        }
    }
}
