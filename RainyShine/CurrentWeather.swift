//
//  CurrentWeather.swift
//  RainyShine
//
//  Created by nongdenchet on 5/16/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import ObjectMapper

class CurrentWeather: Mappable {
    private var _cityName: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    private let dateFormatter: DateFormatter!
    
    required init?(map: Map) {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }
    
    func mapping(map: Map) {
        _cityName    <- map["name"]
        _weatherType <- map["weather.0.main"]
        _currentTemp <- map["main.temp"]
        
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        return dateFormatter.string(from: Date())
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
}
