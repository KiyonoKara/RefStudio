import SwiftUI
import SwiftData

@main
struct RefStudioApp: App {
    @State private var modelContainer: ModelContainer

    init() {
        do {
            let storage = try LibraryStorage.makeDefault()
            let configuration = ModelConfiguration(url: storage.storeURL)
            modelContainer = try ModelContainer(
                for: Resource.self, ResourceGroup.self, Attachment.self,
                configurations: configuration
            )
        } catch {
            fatalError("Failed to create model container: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            // AppShell owns the app's single navigation structure. Views declare no stack.
            AppShell()
                .modelContainer(modelContainer)
        }
    }
}