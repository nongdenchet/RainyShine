//
//  WeatherPresenter.swift
//  RainyShine
//
//  Created by nongdenchet on 5/20/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import CoreLocation
import Moya
import RxSwift
import ObjectMapper

class WeatherPresenter: NSObject, CLLocationManagerDelegate {
    let provider = RxMoyaProvider<WeatherRepository>()
    let disposeBag = DisposeBag()
    let locationManager = CLLocationManager()
    var forecasts: [Forecast]?
    weak var weatherScreen: WeatherScreen?
    
    init(weatherScreen: WeatherScreen) {
        self.weatherScreen = weatherScreen
        self.forecasts = []
    }
    
    func onViewDidLoad() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        let latestLocation = locations.last
        let latitude = String(format: "%.4f", latestLocation!.coordinate.latitude)
        let longitude = String(format: "%.4f", latestLocation!.coordinate.longitude)
        print("Latitude: \(latitude)")
        print("Longitude: \(longitude)")
        loadCurrentWeather(lat: latitude, lon: longitude)
        loadForecasts(lat: latitude, lon: longitude)
    }
    
    private func loadCurrentWeather(lat: String, lon: String) {
        provider.request(.location(latitude: lat, longitude: lon))
            .mapString()
            .map { Mapper<CurrentWeather>().map(JSONString: $0) }
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                switch event {
                case .next(let response):
                    self.weatherScreen?.update(currentWeather: response!)
                    break;
                case .error(let error):
                    print(error)
                    break;
                default:
                    break;
                }
            }
            .addDisposableTo(disposeBag)
    }
    
    private func loadForecasts(lat: String, lon: String) {
        provider.request(.forecast(latitude: lat, longitude: lon))
            .mapString()
            .map { Mapper<ForecastList>().map(JSONString: $0) }
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                switch event {
                case .next(let response):
                    self.forecasts = response!.forecasts()
                    self.weatherScreen?.updateForecast()
                    break;
                case .error(let error):
                    print(error)
                    break;
                default:
                    break;
                }
            }
            .addDisposableTo(disposeBag)
    }
}
