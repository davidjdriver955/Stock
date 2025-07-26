import Foundation

class AppEventSubscriber {
    private let bus: EventBus<AppEvent>
    private var subscriptionId: UUID?

    init(bus: EventBus<AppEvent>) {
        self.bus = bus
        self.subscriptionId = bus.subscribe { [weak self] event in
            self?.handle(event)
        }
    }

    deinit {
        if let id = subscriptionId {
            bus.unsubscribe(id)
        }
    }

    func handle(_ event: AppEvent) {
        // Child must override
    }
}
