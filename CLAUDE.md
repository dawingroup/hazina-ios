# Hazina iOS — guide for Claude Code sessions

- The Xcode project is generated from `project.yml` by XcodeGen. Edit `project.yml`, never the .xcodeproj.
- Face ID gates every open; the app locks on background. Do not weaken either.
- Tokens live only in the Keychain with `kSecAttrAccessibleWhenUnlockedThisDeviceOnly`. Never UserDefaults.
- Money is integer minor units plus currency, as in the API.
- No real client data in previews, tests or screenshots.
- The iOS app reads and approves; full editing stays in the web admin.
