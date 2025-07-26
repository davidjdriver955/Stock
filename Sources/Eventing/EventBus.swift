import Foundation

final class EventBus<T> {
    typealias Listener = (T) -> Void
    private var listeners: [UUID: Listener] = [:]

    @discardableResult
    func subscribe(_ listener: @escaping Listener) -> UUID {
        let id = UUID()
        listeners[id] = listener
        return id
    }

    func unsubscribe(_ id: UUID) {
        listeners.removeValue(forKey: id)
    }

    func publish(_ event: T) {
        for listener in listeners.values {
            listener(event)
        }
    }
}
