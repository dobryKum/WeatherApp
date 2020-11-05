//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 10/31/20.
//

import Foundation

struct NetworkManager {
    
    static let enviroment: NetworkEnviroment = .oneCall
    static let apiKey = "ed8ce51a2846fc19ccb97d0ef8bb8937"
    private let router = Router<WeatherApi>()
    
    func getNewWeather(lat: Double, lon: Double, type: UnitsType, excludeKey: KeysToExclude, completion: @escaping (_ weatherResponse: WeatherApiResponse?, _ error: String?) -> ()) {
        router.request(.DailyAndHourlyWeather(lat: lat, lon: lon, type: type, key: excludeKey)) { (data, response, error) in
            
            if error != nil {
                completion(nil, "Error has occured")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(WeatherApiResponse.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch { 
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
            
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
            case 200...299:
                return .success
            case 401...500:
                return .failure(NetworkResponse.authenticationError.rawValue)
            case 501...599:
                return .failure(NetworkResponse.badRequest.rawValue)
            case 600:
                return .failure(NetworkResponse.outdated.rawValue)
            default:
                return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated"
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated"
    case failed = "Network request failed"
    case noData = "Response returned with no data to decode"
    case unableToDecode = "Couldn't decode the response"
}

enum Result<String> {
    case success
    case failure(String)
}


