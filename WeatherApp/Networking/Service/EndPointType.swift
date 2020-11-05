//
//  EndPointType.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 10/31/20.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
