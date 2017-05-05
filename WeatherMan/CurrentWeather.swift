    //
//  CurrentWeather.swift
//  WeatherMan
//
//  Created by Swapna Anandaraman on 08/03/2017.
//  Copyright © 2017 Swapna Anandaraman. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather{
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    // 9/3/17 TODO what are these functions? was expecting getter /setter here
    var cityName: String{
        
        if (_cityName == nil){
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String{
        
        if (_date == nil){
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String{
        
        if (_weatherType == nil){
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double{
        
        if (_currentTemp == nil){
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        
        //let currentURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            print(result)
        //    print(response)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                    
                }// cityName
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    
                    if let type = weather[0]["main"] as? String{
                        self._weatherType = type.capitalized
                        print(self._weatherType)
                        
                    }
                }// weather type
                
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    
                    if let temp = main["temp"] as? Double{
                        self._currentTemp = Double(temp - 273.15).rounded()
                        
                        print(self._currentTemp)
                    
                }// temperature
  
                
                }
                
            }

            
         completed()
        }
        
    }

}
