    //
//  WeatherVC.swift
//  WeatherMan
//
//  Created by Swapna Anandaraman on 13/02/2017.
//  Copyright © 2017 Swapna Anandaraman. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate{

    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentPlaceLabel: UILabel!
    
 
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    var currentWeather: CurrentWeather! 
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        currentWeather = CurrentWeather()
        
        // Set the location Manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
       // forecast = Forecast()
       // print(CURRENT_WEATHER_URL)

     }
    
    func locationAuthorizationStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitute = currentLocation.coordinate.longitude
            currentWeather.downloadWeatherDetails{
                self.downloadForecastData{
                    
                    // Code to Update UI
                    self.updateMainUI()
                }
                
            }            
        }else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthorizationStatus()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthorizationStatus()
        
        
    }

    
    func downloadForecastData(completed : DownloadComplete){
        //let currentURL = URL(string: CURRENT_WEATHER_URL)
        print(CURRENT_FORECAST_URL)
        Alamofire.request(CURRENT_FORECAST_URL).responseJSON { response in
            let result = response.result
            print(result)
            print(response)
            
            
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list{
                        let forecast = Forecast(weatherDict : obj)
                        self.forecasts.append(forecast)
                       // print("Forecast Data")
                        //print(obj)
                        
                    }
                    //self.forecasts.remove(at: 0)
                    self.weatherTableView.reloadData()
                    
                }
            }
            
        }
        completed()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let	cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }
        else{
            
            return WeatherCell()
        }
    
    }
    
    func updateMainUI(){
        
        currentPlaceLabel.text = currentWeather.cityName
        currentTempLabel.text = String(currentWeather.currentTemp)
        dateLabel.text = currentWeather.date
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }


}

