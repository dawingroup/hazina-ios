import XCTest
@testable import Hazina

final class MoneyTests: XCTestCase {
    func testUGXHasNoMinorUnits() {
        XCTAssertTrue(Money.format(1_460_000_000, "UGX").contains("1,460,000,000"))
    }

    func testUSDUsesCents() {
        XCTAssertTrue(Money.format(1_000_000, "USD").contains("10,000.00"))
    }

    func testKeychainRoundTrip() throws {
        let store = KeychainStore(service: "app.hazina.tests")
        try store.save("token-123", for: "session")
        XCTAssertEqual(store.read("session"), "token-123")
        store.delete("session")
        XCTAssertNil(store.read("session"))
    }
}
