//
//  ParameterEncoding.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 10/31/20.
//

import Foundation

public typealias Parameters = [String:Any]

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameters encoding failed"
    case missingURL = "URL is nil"
}
