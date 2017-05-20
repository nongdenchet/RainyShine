//
//  WeatherScreen.swift
//  RainyShine
//
//  Created by nongdenchet on 5/20/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

protocol WeatherScreen: class {
    func update(currentWeather: CurrentWeather)
    func updateForecast()
}
