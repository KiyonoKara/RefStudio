//
//  RefStudioApp.swift
//  RefStudio
//
//  Created by Kiyo on 10/9/26.
//


import SwiftUI
import SwiftData

@main
struct RefStudioApp: App {
    @State private var modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: Resource.self, Collection.self, Attachment.self)
        } catch {
            fatalError("Failed to create model container: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ResourceListView()
                .modelContainer(modelContainer)
        }
    }
}
