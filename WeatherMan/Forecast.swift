//
//  Forecast.swift
//  WeatherMan
//
//  Created by Swapna Anandaraman on 14/03/2017.
//  Copyright © 2017 Swapna Anandaraman. All rights reserved.
//

import Foundation
import Alamofire

class Forecast{
    
    var _date : String!
    var _weatherType : String!
    var _minimumTemperature : String!
    var _maximumTemperature : String!
    
    var date : String{
        if _date == nil{
            
            _date = ""
        }
        let  dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = currentDate
        return _date
    }
    
    var weatherType : String{
        
        if _weatherType == nil{
            
            _weatherType = ""
            
        }
        return _weatherType
    }
    
    var minimumTemperature : String{
        
        if _minimumTemperature == nil{
            
            _minimumTemperature = ""
        }
        return _minimumTemperature
    }
    
    var maximumTemperature : String{
        
        if _maximumTemperature == nil {
            
            _maximumTemperature = ""
        }
        return _maximumTemperature
    }

    init (weatherDict : Dictionary<String, AnyObject>){

        // Get min/Max temp
        if let tempDict = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            if let minTemp = tempDict["min"] as? Double{
                self._minimumTemperature = "\(minTemp.rounded())"
                
            }
            if let maxTemp = tempDict["max"] as? Double{
                self._maximumTemperature = "\(maxTemp.rounded())"
            }
            
            
        }
        
        // Get weather Type
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String{
                
                self._weatherType = main
//                if let description = weather[0]["description"] as? String{
//
//                    print("WeatherDescription = \(description)")
//                }
            }
        }
        
        
        // Get Date
        
        if let date = weatherDict["dt"] as? Double{
            let unixDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            self._date = unixDate.dayOfTheWeek()
            
        }
    }
    
}

extension Date{
    
    func dayOfTheWeek()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
