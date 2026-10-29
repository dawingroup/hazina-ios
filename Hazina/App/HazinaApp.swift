import SwiftUI

@main
struct HazinaApp: App {
    @StateObject private var gate = BiometricGate()
    @Environment(\.scenePhase) private var phase

    var body: some Scene {
        WindowGroup {
            ZStack {
                if gate.isUnlocked {
                    HomeView()
                } else {
                    LockedView(unlock: { Task { await gate.unlock() } })
                }
            }
            // Privacy blur in the app switcher.
            .blur(radius: phase == .active ? 0 : 24)
            .task { await gate.unlock() }
            .onChange(of: phase) { _, new in
                if new == .background { gate.lock() }
            }
        }
    }
}

private struct LockedView: View {
    let unlock: () -> Void
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "lock.shield").font(.system(size: 48))
            Text("Hazina is locked").font(.headline)
            Button("Unlock with Face ID", action: unlock).buttonStyle(.borderedProminent)
        }
    }
}
