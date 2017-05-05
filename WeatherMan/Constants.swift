//
//  Constants.swift
//  WeatherMan
//
//  Created by Swapna Anandaraman on 07/03/2017.
//  Copyright © 2017 Swapna Anandaraman. All rights reserved.
//

import Foundation
//http://api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID={APIKEY}
//16 day
// api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=16
// forecast
// api.openweathermap.org/data/2.5/forecast?lat=35&lon=139
// forecast for 5 days
//http://api.openweathermap.org/data/2.5/forecast/daily?lat=52.6784&lon=-2.4453&units=metric&cnt=5&APPID=932c9edb838037631ecd714ebcc9ec90
let BASE_URL = "http:/api.openweathermap.org/data/2.5/weather?"
let APP_ID = "&APPID="
let API_KEY = "932c9edb838037631ecd714ebcc9ec90"
// Telford
//let LAT = "lat=52.6784"
//let LONG = "&lon=-2.4453"
let LAT = "lat="
let LONG = "&lon="

// Telford US
//let LAT = "lat=40.322"
//let LONG = "&lon=-75.328"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LAT)\(Location.sharedInstance.latitude!)\(LONG)\(Location.sharedInstance.longitute!)\(APP_ID)\(API_KEY)"

let GENERAL_BASE = "http:/api.openweathermap.org/data/2.5/"
let GENERAL_FORECAST_DAILY = "forecast/daily"
let GENERAL_FORECAST_COUNT = "&cnt=16"
let QUESTION_MARK = "?"
let METRIC_UNITS = "&units=metric"
let CURRENT_FORECAST_URL = "\(GENERAL_BASE)\(GENERAL_FORECAST_DAILY)\(QUESTION_MARK)\(LAT)\(Location.sharedInstance.latitude!)\(LONG)\(Location.sharedInstance.longitute!)\(METRIC_UNITS)\(GENERAL_FORECAST_COUNT)\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
