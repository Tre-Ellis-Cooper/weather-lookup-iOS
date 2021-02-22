//
//  WeatherLoader.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/21/21.
//

import Foundation
import Combine


// Weather model loader
final class WeatherLoader: ObservableObject {
    let session: URLSession
    
    private var cancellable: AnyCancellable?
    
    @Published var state: State = .initial
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    deinit {
        cancellable = nil
    }
    
    func loadCurrentWeather(cityName: String) {
        state = .loading
        cancellable = currentWeatherPipeline(cityName: cityName)
            .map(State.init)
            .receive(on: DispatchQueue.main)
            .assign(to: \.state, on: self)
    }
    
    private func currentWeatherPipeline(cityName: String) ->
    Pipeline<Weather> {
        session.pipeline(
            for: OpenWeatherAPI.forecast(cityName: cityName)
        )
        .map(Result.success)
        .replaceError(with: Result.failure)
        .eraseToAnyPublisher()
    }
}

// MARK: - WeatherLoader.State
extension WeatherLoader {
    enum State {
        case initial
        case loading
        case failure
        case success(result: WeatherViewModel)
        
        init(result: Result<Weather>) {
            switch result {
            case .failure:
                self = .failure
            case .success(let value):
                self = .success(result: .init(value))
            }
        }
    }
}
