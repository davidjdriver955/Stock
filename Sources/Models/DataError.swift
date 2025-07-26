enum DataError: Error {
    case fileNotFound
    case invalidHeader
    case malformedLine(String)
}