//
//  Weather.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

// Weather network model
struct Weather: Codable {
    let list: [Entry]
    let city: City
    
    struct Entry: Codable {
        let main: Main
        let weather: [Category]
        
        struct Main: Codable {
            let temp: Double
            let feels_like: Double
        }
        
        struct Category: Codable {
            let main: String
            let description: String
        }
    }
    
    struct City: Codable {
        let name: String
        let country: String
    }
}
