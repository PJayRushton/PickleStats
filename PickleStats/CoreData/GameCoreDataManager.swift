//
//  GameCoreDataManager.swift
//  PickleStats
//
//  Created by Parker Rushton on 4/27/21.
//

import Foundation
import CoreData

class GameCoreDataManager {
    
    static let shared = GameCoreDataManager()
    private let context = PersistenceController.shared.viewContext
    
    func saveGame(title: String) {
        let entity = Game.entity()
        let newGame = Game(entity: entity, insertInto: context)
        newGame.id = UUID().uuidString
        newGame.title = title
        saveContext()
    }
    
}


// MARK: - Private

private extension GameCoreDataManager {
    
    func saveContext() {
        try? context.save()
    }
    
}
