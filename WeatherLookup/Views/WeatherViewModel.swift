//
//  WeatherViewModel.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//


import Foundation

// Weather view model. Used in the WeatherView
// and WeatherDetailView.
struct WeatherViewModel {
    let city: String
    let country: String
    let entries: [Entry]
    
    var cityLabel: String {
        .init(format: .localized("City_Format"), city, country)
    }
    
    struct Entry: Identifiable {
        let id: UUID = UUID()
        let temp: Int
        let feelsLike: Int
        let category: String?
        let detail: String?
        
        var tempLabel: String {
            .init(format: .localized("Temp_Format"), "\(temp)")
        }
        
        var feelsLikeLabel: String {
            .init(
                format: .localized("Feels_Like_Format"),
                "\(feelsLike)"
            )
        }
    }
}

extension WeatherViewModel {
    init(_ model: Weather) {
        city = model.city.name
        country = model.city.country
        entries = model.list.map {
            Entry(
                temp: Int($0.main.temp),
                feelsLike: Int($0.main.feels_like),
                category: $0.weather.first?.main,
                detail: $0.weather.first?.description
            )
        }
    }
}
