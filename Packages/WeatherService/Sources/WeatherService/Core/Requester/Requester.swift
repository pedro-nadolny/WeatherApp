import Foundation
import WeatherServiceInterface

protocol Requester {
    func make<Model: Decodable>(request: Request, completion: @escaping Completion<Model>)
    func make(dataRequest: Request, completion: @escaping Completion<Data>)
}
