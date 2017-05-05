//
//  Location.swift
//  WeatherMan
//
//  Created by Swapna Anandaraman on 30/03/2017.
//  Copyright © 2017 Swapna Anandaraman. All rights reserved.
//

import CoreLocation

class Location{
    static var sharedInstance = Location()
    private init() {
    }
    
    var latitude : Double!
    var longitute : Double!
    
}


