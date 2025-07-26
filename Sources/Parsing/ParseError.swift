enum ParseError: Error, CustomStringConvertible {
    case wrongFieldCount(Int)
    case badDate(String)
    case badPrice(String)
    case badVolume(String)

    var description: String {
        switch self {
        case .wrongFieldCount(let count): return "Expected 4 fields, got \(count)"
        case .badDate(let val): return "Invalid date: \(val)"
        case .badPrice(let val): return "Invalid price: \(val)"
        case .badVolume(let val): return "Invalid volume: \(val)"
        }
    }
}
