//
//  DayWeather.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 10/29/20.
//

import Foundation

struct WeatherApiResponse {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let timezoneOffset: Double
    let current: CurrentWeather
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
}

extension WeatherApiResponse: Codable {
    
    private enum WeatherApiResponseCodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
        case hourly
        case daily
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WeatherApiResponseCodingKeys.self)
        
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        timezone = try container.decode(String.self, forKey: .timezone)
        timezoneOffset = try container.decode(Double.self, forKey: .timezoneOffset)
        current = try container.decode(CurrentWeather.self, forKey: .current)
        hourly = try container.decode([HourlyWeather].self, forKey: .hourly)
        daily = try container.decode([DailyWeather].self, forKey: .daily)
    }
    
}

//TODO: add extensions, refactor structure properties

struct CurrentWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Double
    let humidity: Double
    let dew_point: Double
    let uvi: Double
    let clouds: Double
    let visibility: Double
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
//    let rain: Rain
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct DailyWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: DailyWeatherTemperature
    let feels_like: DailyWeatherFeelsLikeTemperature
    let pressure: Double
    let humidity: Double
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
    let clouds: Double
    let uvi: Double?
    let pop: Double?
    let rain: Double?
    let snow: Double?
}

struct Rain {
    let firstHour: Double
}

extension Rain: Codable {
    private enum RainCodingKeys: String, CodingKey {
        case firstHour = "1h"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RainCodingKeys.self)
        
        firstHour =  try container.decode(Double.self, forKey: .firstHour)
    }
}

struct DailyWeatherTemperature: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct DailyWeatherFeelsLikeTemperature: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct HourlyWeather: Codable {
    let dt: Int
    let temp: Double
    let feels_like: Double
    let pressure: Double
    let humidity: Double
    let dew_point: Double
    let clouds: Double
    let visibility: Double
    let wind_speed: Double
    let wind_deg: Double
    let weather: [Weather]
}
