import Foundation

func parseStockEvent(line: String, formatter: ISO8601DateFormatter) -> Result<StockEvent, ParseError> {
    let parts = line.split(separator: "|").map { String($0) }

    guard parts.count == 4 else {
        return .failure(.wrongFieldCount(parts.count))
    }

    guard let timestamp = formatter.date(from: parts[0]) else {
        return .failure(.badDate(parts[0]))
    }

    guard let price = Double(parts[2]) else {
        return .failure(.badPrice(parts[2]))
    }

    guard let volume = Int(parts[3]) else {
        return .failure(.badVolume(parts[3]))
    }

    return .success(StockEvent(timestamp: timestamp, symbol: parts[1], price: price, volume: volume))
}


func loadStockEvents(fromFile path: String, into bus: EventBus<AppEvent>) {
    guard let contents = try? String(contentsOfFile: path) else {
        bus.publish(.fatal(message: "Could not read file: \(path)", exitCode: 3))
        return
    }

    let lines = contents
        .split(separator: "\n")
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        .filter { !$0.isEmpty }

    guard let header = lines.first, header == "timestamp|symbol|price|volume" else {
        bus.publish(.fatal(message: "Unexpected header: '\(lines.first ?? "<empty>")'", exitCode: 3))
        return
    }

    let formatter = ISO8601DateFormatter()

    for (index, line) in lines.dropFirst().enumerated() {
        let lineNumber = index + 2 // +2 to account for dropped header + 1-based line numbers
        switch parseStockEvent(line: line, formatter: formatter) {
        case .success(let event):
            bus.publish(.stock(event))
        case .failure(let err):
            bus.publish(.lineError(line: line, lineNumber: lineNumber, reason: err.description))
        }
    }
}

