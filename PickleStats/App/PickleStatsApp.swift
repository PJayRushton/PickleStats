//
//  PickleStatsApp.swift
//  PickleStats
//
//  Created by Parker Rushton on 4/27/21.
//

import SwiftUI

@main
struct PickleStatsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            GamesView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
