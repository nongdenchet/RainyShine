//
//  WeatherRepository.swift
//  RainyShine
//
//  Created by nongdenchet on 5/15/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import Moya

enum WeatherRepository {
    case location(latitude: String, longitude: String)
    case forecast(latitude: String, longitude: String)
}

extension WeatherRepository: TargetType {
    var baseURL: URL { return URL(string: API_URL)! }
    var path: String {
        switch self {
        case .location:
            return "/weather"
        case .forecast:
            return "/forecast/daily"
        }
    }
    var method: Moya.Method {
        switch self {
        case .location, .forecast:
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .location(let latitude, let longitude),
             .forecast(let latitude, let longitude):
            return ["lat": latitude, "lon": longitude]
        }
    }
    var sampleData: Data {
        switch self {
        case .location, .forecast:
            return "{}".utf8Encoded
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .location, .forecast:
            return URLEncoding.default
        }
    }
    var task: Task {
        switch self {
        case .location, .forecast:
            return .request
        }
    }
}

// MARK: - Helpers
extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
