import Foundation

// MARK: - Entry Point

do {
    try run()
} catch {
    print("❌ Unhandled error: \(error)")
    exit(99)
}

// MARK: - App Bootstrap

func run() throws {
    let bus = EventBus<AppEvent>()
    let router = AppEventRouter()
    router.registerAll(to: bus)

    // Keep reference alive
    let cliFatal = CliFatalErrorHandler(bus: bus)

    let path = "/home/david/swiftproj/Stock/Resources/testfile.txt"

    if !FileManager.default.fileExists(atPath: path) {
        bus.publish(.fatal(message: "Missing file", exitCode: 1))
        return
    }

    loadStockEvents(fromFile: path, into: bus)
}
