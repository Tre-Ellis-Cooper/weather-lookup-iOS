//
//  Strings.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/21/21.
//

// Constants file.
extension String {
    struct OpenWeatherAPI {
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        
        struct Keys {
            // Would not keep this in the source code in production development.
            // Obvious security risk.
            static let appID = "65d00499677e59496ca2f318eb68c049"
        }
        
        struct Paths {
            static let forecast = "/data/2.5/forecast"
        }
        
        struct QueryKeys {
            static let cityName = "q"
            static let appID = "appid"
            static let units = "units"
        }
    }
}
