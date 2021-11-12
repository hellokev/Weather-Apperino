//
//  ContentView.swift
//  Weather App
//
//  Created by user198043 on 9/30/21.
//

import SwiftUI

struct ContentView: View {
    let url = "https://api.openweathermap.org/data/2.5/weather?q=bat%20cave&units=imperial&appid=9d958a66e735735b56e66b55bba5ada5"
    
    private func getData(from url: String) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something wen wrong")
                return
            }
            
            //have data
            var result: weatherInfo?
            do{
                result = try JSONDecoder().decode(weatherInfo.self, from: data)
            }
            catch {
                print("Failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            print(json.info.temp)
            print(json.info.feels_like)
            print(json.info.humidty)
            print(json.info.deg)
            print(json.info.country)
            print(json.info.timezone)
            print(json.info.temp_min)
            print(json.info.temp_max)
            print(json.info.sunset)
        })
        
        task.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct weatherInfo: Codable {
    let info: weatherVals

}

struct weatherVals: Codable {
    let lon: Float
    let lan: Float
    let id: Int
    let main: String
    let decription: String
    let icon: String
    let base: String
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Int
    let humidty: Int
    let visibility: Int
    let speed: Float
    let deg: Int
    let gust: Float
    let all: Int
    let dt: Int
    let type: Int
    let country: String
    let sunrise: Int
    let sunset: Int
    let timezone: Int
    let name: String
    let cod: Int
}

/*{
 coord: {
 lon: -82.2871,
 lat: 35.4515
 },
 weather: [
 {
 id: 800,
 main: "Clear",
 description: "clear sky",
 icon: "01d"
 }
 ],
 base: "stations",
 main: {
 temp: 72.28,
 feels_like: 71.04,
 temp_min: 67.53,
 temp_max: 76.24,
 pressure: 1017,
 humidity: 39
 },
 visibility: 10000,
 wind: {
 speed: 3.51,
 deg: 140,
 gust: 5.77
 },
 clouds: {
 all: 0
 },
 dt: 1636579680,
 sys: {
 type: 2,
 id: 2017496,
 country: "US",
 sunrise: 1636545595,
 sunset: 1636583184
 },
 timezone: -18000,
 id: 4456121,
 name: "Bat Cave",
 cod: 200
 }*/
