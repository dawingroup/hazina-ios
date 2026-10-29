# Hazina iOS

SwiftUI app for the Hazina owner: daily view, approvals and capture. Full editing stays in the web admin.

```bash
brew install xcodegen
xcodegen            # generates Hazina.xcodeproj from project.yml (not committed)
open Hazina.xcodeproj
```

- Face ID on every open, privacy blur in the app switcher, session token in the Keychain (this device only).
- `fastlane test` runs unit tests; `fastlane beta` uploads to TestFlight once HazinaCo's Apple Developer account exists.
- API models will be generated from the Hazina API's OpenAPI spec in sprint 1.
