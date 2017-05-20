//
//  ForecastList.swift
//  RainyShine
//
//  Created by nongdenchet on 5/20/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import ObjectMapper

class ForecastList: Mappable {
    private var _forecasts: [Forecast]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        _forecasts <- map["list"]
    }
    
    func forecasts() -> [Forecast]? {
        return _forecasts
    }
}
