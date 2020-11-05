//
//  WeatherEndPoint.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 10/31/20.
//

import Foundation

enum NetworkEnviroment {
    case oneCall
    case current
}

enum WeatherApi {
    case DailyAndHourlyWeather(lat: Double, lon: Double, type: UnitsType, key: KeysToExclude)
    case CurrentWeather(lat: Double, lon: Double, type: UnitsType)
}

enum UnitsType: String {
    case si = "si"
    case metric = "metric"
    case imperial = "imperial"
}

enum KeysToExclude: String {
    case minutely = "minutely"
    case hourly = "hourly"
    case daily = "daily"
    case alerts = "alerts"
}

extension WeatherApi: EndPointType {
    
    var enviromentBaseUrl: String {
        switch NetworkManager.enviroment {
        case .oneCall:
            return "https://api.openweathermap.org/data/2.5/onecall"
        case .current:
            return "http://api.openweathermap.org/data/2.5/forecast/daily"
        }
    }
    
    var baseUrl: URL {
        guard let url = URL(string: enviromentBaseUrl) else {
            fatalError("baseURL couldn't be configured")
        }
        return url
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .DailyAndHourlyWeather(let lat, let lon, let type, let key):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["appid":NetworkManager.apiKey,
                                                      "lat":"\(lat)",
                                                      "lon":"\(lon)",
                                                      "units":"\(type)",
                                                      "exclude":"\(key)"])
        case .CurrentWeather(let lat, let lon, let type):
            return .requestParameters(bodyParameters: nil, urlParameters: ["appid":NetworkManager.apiKey,
                                                                           "lat":"\(lat)",
                                                                           "lon":"\(lon)",
                                                                           "units":"\(type)"])
        }
    }
}
