import Foundation

protocol Parser {
    func parse<Model: Decodable>(data: Data) throws -> Model
}
