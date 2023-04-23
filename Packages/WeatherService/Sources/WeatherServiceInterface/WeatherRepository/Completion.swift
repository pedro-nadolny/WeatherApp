import Foundation

public typealias Completion<Model> = (Result<Model, RequesterError>) -> Void
