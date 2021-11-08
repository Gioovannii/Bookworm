//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Giovanni Gaffé on 2021/11/8.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
