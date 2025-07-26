enum AppEvent {
    case stock(StockEvent)
    case lineError(line: String, lineNumber: Int, reason: String)
    case fatal(message: String, exitCode: Int)
}
