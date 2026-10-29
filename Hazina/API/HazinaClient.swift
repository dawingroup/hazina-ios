import Foundation

/// Minimal client for the Hazina API. Sprint 1 replaces the hand-written models with
/// types generated from the API's OpenAPI spec (swift-openapi-generator).
struct NetWorth: Decodable, Sendable {
    let currency: String
    let assetsMinor: Int64
    let liabilitiesMinor: Int64
    let netWorthMinor: Int64
}

struct HazinaClient: Sendable {
    let baseURL: URL
    let token: @Sendable () async throws -> String

    func netWorth() async throws -> NetWorth {
        var req = URLRequest(url: baseURL.appending(path: "v1/net-worth"))
        req.setValue("Bearer \(try await token())", forHTTPHeaderField: "Authorization")
        let (data, response) = try await URLSession.shared.data(for: req)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError(.badServerResponse) }
        return try JSONDecoder().decode(NetWorth.self, from: data)
    }
}

enum Money {
    static let exponent: [String: Int] = ["UGX": 0, "USD": 2, "GBP": 2, "KES": 2]

    static func format(_ minor: Int64, _ currency: String) -> String {
        let exp = exponent[currency] ?? 2
        let major = Decimal(minor) / pow(10, exp)
        return major.formatted(.currency(code: currency).precision(.fractionLength(exp)))
    }
}
