final class CliFatalErrorHandler: AppEventSubscriber {
    override func handle(_ event: AppEvent) {
        if case let .fatal(_, code) = event {
            //print("❌ Fatal error: \(message)")
            exit(Int32(code))
        }
    }
}
