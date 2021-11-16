//
//  LocationManager.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/11/21.
//

import Foundation

typealias Geolocation = (latitude: Double, longitude: Double)

enum Location {
    case geolocation(Geolocation)
    case settlement(String)
}

class LocationManager: ObservableObject {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "&appid=9d958a66e735735b56e66b55bba5ada5&units=imperial"
    
    @Published var weatherData: OpenWeatherAPI? = nil
    @Published var isLoading: Bool
    
    init() {
        isLoading = true
        grabWeatherData(at: .settlement("Bat Cave"))
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
}