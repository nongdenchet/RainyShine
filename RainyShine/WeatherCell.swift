//
//  WeatherCellTableViewCell.swift
//  RainyShine
//
//  Created by nongdenchet on 5/14/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    func configure(forecast: Forecast) {
        weatherImage.image = UIImage(named: forecast.weather())
        weatherLabel.text = forecast.weather()
        lowTempLabel.text = String(forecast.lowTemp())
        highTempLabel.text = String(forecast.highTemp())
        dateLabel.text = forecast.date()
    }
}
