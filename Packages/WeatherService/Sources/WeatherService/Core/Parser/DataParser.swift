import Foundation
import WeatherServiceInterface

final class DataParser: Parser {
    func parse<Model>(data: Data) throws -> Model where Model: Decodable {
        if let data = data as? Model {
            return data
        }
        
        throw RequesterError.decodeError
    }
}
