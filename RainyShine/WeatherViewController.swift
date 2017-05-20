//
//  ViewController.swift
//  RainyShine
//
//  Created by nongdenchet on 5/14/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WeatherScreen {
    var weatherPresenter: WeatherPresenter!

    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var todayWeather: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeatherCell.self)
        weatherPresenter = WeatherPresenter(weatherScreen: self)
        weatherPresenter.onViewDidLoad()
    }
    
    func update(currentWeather: CurrentWeather) {
        todayLabel.text = currentWeather.date
        cityLabel.text = currentWeather.cityName
        todayWeather.text = currentWeather.weatherType
        tempLabel.text = String(describing: currentWeather.currentTemp)
        weatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    func updateForecast() {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherPresenter.forecasts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as WeatherCell
        cell.configure(forecast: (weatherPresenter.forecasts?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
