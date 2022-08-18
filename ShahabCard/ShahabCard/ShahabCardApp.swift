//
//  ShahabCardApp.swift
//  ShahabCard
//
//  Created by Dev on 17/08/2022.
//

import SwiftUI

@main
struct ShahabCardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
