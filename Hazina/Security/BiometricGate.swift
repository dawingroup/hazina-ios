import LocalAuthentication
import SwiftUI

/// Face ID on every open. Locks again whenever the app goes to the background.
@MainActor
final class BiometricGate: ObservableObject {
    @Published private(set) var isUnlocked = false

    func unlock() async {
        let context = LAContext()
        var error: NSError?
        // Device passcode is the fallback when biometrics are unavailable.
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else { return }
        do {
            isUnlocked = try await context.evaluatePolicy(
                .deviceOwnerAuthentication,
                localizedReason: "Unlock your family wealth data"
            )
        } catch {
            isUnlocked = false
        }
    }

    func lock() { isUnlocked = false }
}
