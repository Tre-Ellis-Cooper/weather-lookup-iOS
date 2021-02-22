//
//  API.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/21/21.
//

import Foundation


// Protocol representing an API.
protocol API {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: Method { get }
    var queryItems: [URLQueryItem]? { get }
}

// HTTP method types.
enum Method: String {
    case GET
}
