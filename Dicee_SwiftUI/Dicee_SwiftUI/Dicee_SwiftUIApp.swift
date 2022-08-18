//
//  Dicee_SwiftUIApp.swift
//  Dicee_SwiftUI
//
//  Created by Dev on 18/08/2022.
//

import SwiftUI

@main
struct Dicee_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
