//
//  Result.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

enum Result<T> {
    case success(value: T)
    case failure
}
