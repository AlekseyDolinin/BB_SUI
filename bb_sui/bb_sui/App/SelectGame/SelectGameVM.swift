import SwiftUI

extension SelectGameView {
    
    @Observable
    class ViewModel {
        
        let dict = AppLanguage.shared.dict
        var indexSelectGame = 0
        
        let modes: [TypeGame] = [
            TypeGame(id: 0, name: "TOWERS", colors: [.orange, .red], nameAnimation: "towerGames"),
            TypeGame(id: 1, name: "COMPETITIONS", colors: [.red, .green], nameAnimation: "competitionsGames"),
            TypeGame(id: 2, name: "QUESTS", colors: [.green, .purple], nameAnimation: "questGames"),
            TypeGame(id: 3, name: "MARATHONS", colors: [.blue, .pink], nameAnimation: "marathonGames"),
            TypeGame(id: 4, name: "LOCATIONS", colors: [.yellow, .red], nameAnimation: "locationGames")
        ]
                
        func selectGame(context: ScrollPhaseChangeContext) {
            let bounds = context.geometry.bounds
            let index: Int = Int((bounds.minX + 40) / bounds.width)
            indexSelectGame = index
        }
        
        func pagingLeft() {
            indexSelectGame -= 1
            print("indexSelectGame: \(indexSelectGame)")
        }
        
        func pagingRight() {
            indexSelectGame += 1
            print("indexSelectGame: \(indexSelectGame)")
        }
    }
}
