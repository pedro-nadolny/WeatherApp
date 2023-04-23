import Foundation

public enum RequesterError: Error {
    case decodeError
    case invalidUrl
    case emptyData
    case requestError(status: Error)
}
