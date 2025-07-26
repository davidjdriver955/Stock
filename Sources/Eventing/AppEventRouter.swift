final class AppEventRouter {
    private var handlers: [AppEventSubscriber] = []

    func registerAll(to bus: EventBus<AppEvent>) {
        handlers = [
            CliEventLogger(bus: bus)//,
            //PriceChangeMonitor(bus: bus),
            //WeeklyAverageMonitor(bus: bus),
            // etc.
        ]
    }
}
