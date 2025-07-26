final class CliEventLogger: AppEventSubscriber {
    override func handle(_ event: AppEvent) {
        switch event {
        case .stock(let stockEvent):
            print("📢 \(stockEvent)")
        case .lineError(let line, let lineNumber, let reason):
            print("⚠️ Line \(lineNumber): Could not parse '\(line)'. Reason: \(reason)")
        case .fatal(let message, let code):
            print("❌ Fatal error: \(message) \n Code \(code)")
        }
    }
}
