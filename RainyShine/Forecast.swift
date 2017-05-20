//
//  Forecast.swift
//  RainyShine
//
//  Created by nongdenchet on 5/20/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import ObjectMapper

class Forecast: Mappable {
    private var _lowTemp: Double!
    private var _highTemp: Double!
    private var _weather: String!
    private var _timestamp: Double!
    private var _date: Date!
    private let dateFormatter: DateFormatter!
    
    required init?(map: Map) {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }
    
    func mapping(map: Map) {
        _lowTemp   <- map["temp.min"]
        _highTemp  <- map["temp.max"]
        _weather   <- map["weather.0.main"]
        _timestamp <- map["dt"]
        _date = Date(timeIntervalSince1970: _timestamp)
    }
    
    func lowTemp() -> Double {
        return _lowTemp
    }
    
    func highTemp() -> Double {
        return _highTemp
    }
    
    func weather() -> String {
        return _weather
    }
    
    func timestamp() -> Double {
        return _timestamp
    }
    
    func date() -> String {
        return dateFormatter.string(from: _date)
    }
}
