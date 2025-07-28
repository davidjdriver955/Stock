import XCTest
@testable import Stock

final class StockEventParserTests: XCTestCase {

    let formatter = ISO8601DateFormatter()

    func testValidLineParsesCorrectly() {
        let line = "2023-05-15T14:30:00Z|AAPL|189.02|1000"
        let result = parseStockEvent(line: line, formatter: formatter)

        switch result {
        case .success(let event):
            XCTAssertEqual(event.symbol, "AAPL")
            XCTAssertEqual(event.price, 189.02, accuracy: 0.001)
            XCTAssertEqual(event.volume, 1000)
        case .failure(let error):
            XCTFail("Expected success, got: \(error)")
        }
    }
}
