import Foundation

struct WeatherStateIconRequest: Request {
    let httpMethod: HTTPMethod = .GET
    var path: String { "icons/\(weatherStateAbbreviation).png" }
    
    let weatherStateAbbreviation: String
}
