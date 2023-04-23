import Foundation

protocol Session {
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> Resumable
}

extension URLSession: Session {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Resumable {
        let task: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler)
        return task
    }
}

