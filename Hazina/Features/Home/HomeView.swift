import SwiftUI

/// MVP home: net worth, runway, next five payments and gap alerts (sprint 6).
struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Net worth") { Text("Connect to the API in sprint 1").foregroundStyle(.secondary) }
                Section("Liquidity runway") { Text("Sprint 4") .foregroundStyle(.secondary) }
                Section("Next five payments") { Text("Sprint 6").foregroundStyle(.secondary) }
            }
            .navigationTitle("Hazina")
        }
    }
}
