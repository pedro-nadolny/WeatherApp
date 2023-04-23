import Foundation

final class SnakeCaseJSONDecoderParser: Parser {
    func parse<Model: Decodable>(data: Data) throws -> Model {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            return try decoder.decode(Model.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            throw DecodingError.dataCorrupted(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw DecodingError.keyNotFound(key, context)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw DecodingError.valueNotFound(value, context)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw DecodingError.typeMismatch(type, context)
        } catch {
            print("error: ", error)
            throw error
        }
    }
}
