import Foundation
import WeatherServiceInterface

final class RequesterImplementation: Requester {
    private let session: Session
    private let responseHandler: ResponseHandler
    private let dataResponseHandler: ResponseHandler
    private let logger: Logger
    
    init(
        session: Session = URLSession.shared,
        responseHandler: ResponseHandler = ResponseHandlerImplementation(),
        dataResponseHandler: ResponseHandler = ResponseHandlerImplementation(parser: DataParser()),
        logger: Logger = DebugPrintLogger()
    ) {
        self.session = session
        self.responseHandler = responseHandler
        self.dataResponseHandler = dataResponseHandler
        self.logger = logger
    }
    
    func make<Model: Decodable>(
        request: Request,
        completion: @escaping Completion<Model>
    ) {
        make(request: request, responseHandler: responseHandler, completion: completion)
    }
    
    func make(dataRequest: Request, completion: @escaping Completion<Data>) {
        make(request: dataRequest, responseHandler: dataResponseHandler, completion: completion)
    }
}

private extension RequesterImplementation {
    func make<Model: Decodable>(
        request: Request,
        responseHandler: ResponseHandler,
        completion: @escaping Completion<Model>
    ) {
        logger.log(request: request)
        
        guard let url = URL(string: request.urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue

        session.dataTask(with: urlRequest) { [responseHandler] data, response, error in
            responseHandler.handleDataTaskResponse(
                data: data,
                response: response,
                error: error,
                completion: completion
            )
        }.resume()
    }
}
