Restructure code into type-based or module-based namespaces once project grows
Expand Railway-Oriented Programming (ROP) validation for StockEvent
Add more test cases (good and bad data) for parsing logic
Add a GUI interface component
Add a web service that sends events to the event bus
Add additional subscriber aggregates (e.g., week average, threshold alert)
Support runtime-specific fatal error handlers (CLI, GUI, Web)
Refactor subscriber registration into a centralized router
Keep event bus cleanly decoupled from file details (e.g., parsing error line numbers)
Consider moving non-trivial types and functions into their own files for structure
Evaluate when to split into multiple modules or targets in Package.swift

Switch to async and allow subscribers to emit events. 
Insert a buying strategy subscriber that knows when to signal buy or sell. 