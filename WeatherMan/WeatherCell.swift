//
//  WeatherCell.swift
//  WeatherMan
//
//  Created by Swapna Anandaraman on 29/03/2017.
//  Copyright © 2017 Swapna Anandaraman. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

   
    @IBOutlet weak var weatherIcon: UIImageView!
 
    @IBOutlet weak var forecastDateLabel: UILabel!

    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    
    func configureCell(forecast : Forecast){
        
        //weatherIcon.image = UIImage(named: forecast.weatherType)
        weatherIcon.image = UIImage(named: "\(forecast.weatherType) Mini")
        weatherTypeLabel.text = forecast._weatherType
        forecastDateLabel.text = forecast._date
        maxTempLabel.text = forecast._maximumTemperature
        minTempLabel.text = forecast._minimumTemperature
    }
}
