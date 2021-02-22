//
//  URLSession+.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

import Foundation
import Combine


typealias Pipeline<T> = AnyPublisher<Result<T>, Never>

// Extension to easily create a data publisher
// from the API protocol.
extension URLSession {
    func pipeline<T: Codable>(for api: API)
    -> AnyPublisher<T, Error> {
        if let request = request(for: api) {
            return dataTaskPublisher(for: request)
                .map(\.data)
                .decode(type: T.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NSError())
                .eraseToAnyPublisher()
        }
    }
    
    private func request(for api: API) -> URLRequest? {
        var components = URLComponents()
        components.scheme = api.scheme
        components.host = api.host
        components.path = api.path
        components.queryItems = api.queryItems
        
        guard let url = components.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = api.method.rawValue
        
        return request
    }
}
