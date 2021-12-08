//
//  Forecast.swift
//  Weather App
//
//  Created by Kevin Loi on 12/6/21.
//

import Foundation


//let url = "https://api.openweathermap.org/data/2.5/onecall?lat=35.4515&lon=-82.2871&exclude=current,minutely,alerts&units=imperial&appid=9d958a66e735735b56e66b55bba5ada5"

var latitude: Double?
var longitude: Double?

let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
let areaWithNoSpaces = "?lat=\(latitude)&lon=\(longitude)"
let apiKey = "imperial&appid=7da6d65192a91313e2d8bf49ef2c7533"

let Url = "\(baseURL)\(areaWithNoSpaces)&exclude=current,minutely,alerts&units=\(apiKey)"

// MARK: - Forecast
struct Forecast: Codable {
    let lat, lon: Double
    let timezone: String?
    let timezoneOffset: Int?
    let hourly: [Hourly]?
    let daily: [Daily]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case hourly, daily
    }
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset, moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherOut]?
    let clouds: Int?
    let pop, uvi: Double?
    let rain, snow: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain, snow
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - WeatherOut
struct WeatherOut: Codable {
    let id: Int?
    let main: Master?
    let weatherDescription: Description?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Master: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case rainAndSnow = "rain and snow"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
}

struct Weekly: Codable {
    let dt: Int?
    let temp: Double?
}

