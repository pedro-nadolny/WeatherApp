import Foundation

protocol Request {
    var httpMethod: HTTPMethod { get }
    var path: String { get }
}

extension Request {
    var basePath: String { "https://cdn.faire.com/static/mobile-take-home/" }
    var urlString: String { basePath + path }
}
