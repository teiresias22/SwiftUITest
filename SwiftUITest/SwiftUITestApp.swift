//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by Joonhwan Jeon on 2022/11/09.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
