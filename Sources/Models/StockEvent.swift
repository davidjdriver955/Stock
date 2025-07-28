import Foundation

struct StockEvent {
    let timestamp: Date
    let symbol: String
    let price: Double
    let volume: Int
}

extension StockEvent {
    func prettyPrint() -> String {
        let formatter = ISO8601DateFormatter()
        return "• [\(formatter.string(from: timestamp))] \(symbol): $\(price) x \(volume)"
    }
}
