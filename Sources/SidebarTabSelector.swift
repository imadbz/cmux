import SwiftUI

extension Notification.Name {
    static let cmuxSidebarSwitchToSearch = Notification.Name("cmuxSidebarSwitchToSearch")
    static let cmuxSidebarSwitchToExplorer = Notification.Name("cmuxSidebarSwitchToExplorer")
}

/// Tab selector below the traffic lights — switches between Workspaces, Explorer, and Search.
struct SidebarTabSelector: View {
    @Binding var selected: ContentView.SidebarTab

    private let tabs: [(ContentView.SidebarTab, String)] = [
        (.workspaces, "square.stack"),
        (.explorer, "folder"),
        (.search, "magnifyingglass"),
    ]

    private func accessibilityLabel(for tab: ContentView.SidebarTab) -> String {
        switch tab {
        case .workspaces:
            return String(localized: "sidebar.workspaces", defaultValue: "Workspaces")
        case .explorer:
            return String(localized: "sidebar.explorer", defaultValue: "Explorer")
        case .search:
            return String(localized: "sidebar.search", defaultValue: "Search")
        }
    }

    @ViewBuilder
    private func tabButton(for tab: ContentView.SidebarTab, icon: String) -> some View {
        let button = Button {
            selected = tab
        } label: {
            Image(systemName: icon)
                .font(.system(size: 12, weight: selected == tab ? .semibold : .regular))
                .frame(maxWidth: .infinity)
                .frame(height: 24)
                .foregroundStyle(selected == tab ? .primary : .tertiary)
                .background(
                    selected == tab
                        ? RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.08))
                        : nil
                )
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(accessibilityLabel(for: tab))
        .help(accessibilityLabel(for: tab))
        .accessibilityAddTraits(selected == tab ? .isSelected : [])
    }

    var body: some View {
        VStack(spacing: 0) {
            // Tab buttons
            HStack(spacing: 2) {
                ForEach(tabs, id: \.0) { tab, icon in
                    tabButton(for: tab, icon: icon)
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 6)
        }
    }
}
