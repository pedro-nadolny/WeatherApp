import Foundation

struct LocationWeatherRequest: Request {
    let httpMethod: HTTPMethod = .GET
    var path: String { "\(locationId).json" }
    
    let locationId: String
}
