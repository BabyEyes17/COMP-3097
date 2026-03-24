//
//  GeoLogApp.swift
//  GeoLog
//
//  Created by Jayden Lewis on 2026-03-24.
//

import SwiftUI
import CoreData

@main
struct GeoLogApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
