import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section("Workspace") {
                Label("GitHub account", systemImage: "person.crop.circle")
                Label("Appearance", systemImage: "circle.lefthalf.filled")
                Label("Accessibility", systemImage: "accessibility")
            }
        }
        .navigationTitle("Settings")
    }
}
