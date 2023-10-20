//
//  QuranApp_SwiftUIApp.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 20/10/23.
//

import SwiftUI
import SwiftData

@main
struct QuranApp_SwiftUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
