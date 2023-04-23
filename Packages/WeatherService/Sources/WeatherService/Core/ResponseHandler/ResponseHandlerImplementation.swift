import Foundation
import WeatherServiceInterface

final class ResponseHandlerImplementation: ResponseHandler {
    private let parser: Parser
    
    init(parser: Parser = SnakeCaseJSONDecoderParser()) {
        self.parser = parser
    }
    
    func handleDataTaskResponse<Model: Decodable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: Completion<Model>
    )  {
        if let error {
            debugPrint("❌ Error Response: \(error.localizedDescription)")
            completion(.failure(.requestError(status: error)))
            return
        }
        
        guard let data else {
            completion(.failure(.emptyData))
            return
        }
        
        do {
            let model: Model = try parser.parse(data: data)
            completion(.success(model))
        } catch {
            completion(.failure(.decodeError))
        }
    }
}
