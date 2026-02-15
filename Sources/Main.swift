import SwiftUI

@main
struct UDEManagerApp: App {
    @AppStorage("menuItems") private var menuItemsData: Data = Data()
    @State private var menuItems: [MenuItem] = []

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    loadMenuItems()
                }
                .commands {
                    CommandMenu("Workflows") {
                        // Add your workflow commands here
                        ForEach(menuItems) { item in
                            Button(item.title) {
                                // Handle menu item action
                            }
                        }
                    }
                }
        }
    }

    private func loadMenuItems() {
        if let decodedItems = try? JSONDecoder().decode([MenuItem].self, from: menuItemsData) {
            menuItems = decodedItems
        }
    }

    private func saveMenuItems() {
        if let encoded = try? JSONEncoder().encode(menuItems) {
            menuItemsData = encoded
        }
    }
}

struct MenuItem: Identifiable, Codable {
    var id: UUID
    var title: String
    var action: String
}