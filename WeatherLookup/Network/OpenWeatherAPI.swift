//
//  OpenWeatherAPI.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/21/21.
//

import Foundation


// Representation of Open Weather API.
enum OpenWeatherAPI {
    case forecast(cityName: String, units: Units = .imperial)
}

// MARK: - API
extension OpenWeatherAPI: API {
    var scheme: String {
        Strings.scheme
    }
    
    var host: String {
        Strings.host
    }
    
    var path: String {
        switch self {
        case .forecast:
            return Strings.Paths.forecast
        }
    }
    
    var method: Method {
        switch self {
        case .forecast:
            return .GET
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .forecast(let cityName, let units):
            return [
                URLQueryItem(
                    name: Strings.QueryKeys.cityName,
                    value: cityName
                ),
                URLQueryItem(
                    name: Strings.QueryKeys.appID,
                    value: Strings.Keys.appID
                ),
                URLQueryItem(
                    name: Strings.QueryKeys.units,
                    value: units.rawValue
                )
            ]
        }
    }
}

// MARK: - OpenWeatherAPI.Units
extension OpenWeatherAPI {
    enum Units: String {
        case imperial
        case metric
        case standard
    }
}

// MARK: - Helpers
extension OpenWeatherAPI {
    private var Strings: String.OpenWeatherAPI.Type {
        String.OpenWeatherAPI.self
    }
}
