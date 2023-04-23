import Foundation

final class DebugPrintLogger: Logger {
    func log(request: Request) {
        debugPrint("📶 REQUEST LOG \(request.httpMethod.rawValue) \(request.urlString)")
    }
}
