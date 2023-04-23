import Foundation
import WeatherServiceInterface

protocol ResponseHandler {
    func handleDataTaskResponse<Model: Decodable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: Completion<Model>
    )
}
