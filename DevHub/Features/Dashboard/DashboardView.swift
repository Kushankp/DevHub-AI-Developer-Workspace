import SwiftUI

struct DashboardView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                DashboardHeader()

                ContentUnavailableView(
                    "Connect GitHub",
                    systemImage: "chevron.left.forwardslash.chevron.right",
                    description: Text("Sign in to review repositories, pull requests, issues, and assigned reviews.")
                )
                .frame(maxWidth: .infinity, minHeight: 320)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
        }
        .navigationTitle("DevHub")
    }
}

private struct DashboardHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Developer Workspace")
                .font(.title2.weight(.semibold))
            Text("A focused command center for code review, repository health, and daily engineering flow.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    NavigationStack {
        DashboardView()
    }
}
