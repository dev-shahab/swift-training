//
//  HackerNewsApp.swift
//  HackerNews
//
//  Created by Dev on 19/08/2022.
//

import SwiftUI

@main
struct HackerNewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
