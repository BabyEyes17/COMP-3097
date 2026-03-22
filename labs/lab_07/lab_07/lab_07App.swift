//
//  lab_07App.swift
//  lab_07
//
//  Created by Jayden Lewis on 2026-03-17.
//

import SwiftUI

@main
struct lab_07App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
