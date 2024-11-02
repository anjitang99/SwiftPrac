//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by jihoon an on 10/9/24.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
