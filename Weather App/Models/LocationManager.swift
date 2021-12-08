//
//  LocationManager.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/11/21.
//

import Foundation
import CoreLocation


typealias Geolocation = (latitude: Double, longitude: Double)

enum Location {
    case geolocation(Geolocation)
    case settlement(String)
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "&appid=9d958a66e735735b56e66b55bba5ada5&units=imperial"
    
    var locationManager : CLLocationManager
    
    @Published var weatherData: OpenWeatherAPI? = nil
    @Published var isLoading: Bool

    override init() {
        isLoading = true
        locationManager = CLLocationManager()
        super.init()
        grabWeatherData(at: .settlement("Bat Cave"))
        grabForecastData(from: "https://api.openweathermap.org/data/2.5/onecall?lat=35.4515&lon=-82.2871&exclude=current,minutely,alerts&units=imperial&appid=9d958a66e735735b56e66b55bba5ada5")
        
        locationManager = CLLocationManager()
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func grabWeatherData(at place: Location) {
        var url: URL
        
        switch place {
        case .geolocation(let geoCoords):
            let (latitude, longitude) = geoCoords
            let apiUrl = "\(baseUrl)?lat=\(latitude)&lon=\(longitude)\(apiKey)"
            url = URL(string: apiUrl)!
           

        case .settlement(let area):
            let areaWithNoSpaces = area.replacingOccurrences(of: " ", with: "%20")
            let apiUrl = "\(baseUrl)?q=\(areaWithNoSpaces)\(apiKey)"
            print(apiUrl)
            url = URL(string: apiUrl)!
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
                    do {
                        if let postData = data {
                            let decodedData = try JSONDecoder().decode(OpenWeatherAPI.self, from: postData)
                            DispatchQueue.main.async {
                                self.weatherData = decodedData
                                self.isLoading = false
                            }
                        } else {
                            print("No data")
                        }
                    } catch {
                        print(error)
                    }
        }.resume()
    }
    
    func grabForecastData(from url: String) {
        print(url)
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            // have data
            var result: Forecast?
            do {
                result = try JSONDecoder().decode(Forecast.self, from: data)
            }
            catch {
                print("Failed to do \(error.localizedDescription)")
            }
            
           /* guard let json = result else {
                return
            }*/
            
            guard let json = result else {
                       print("test")
                       return
           }
            DispatchQueue.main.sync {
                print(json.lat)
                print(json.lon)
            }
        })
        task.resume()
        
    }

}
