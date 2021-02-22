//
//  Strings.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

import Foundation


// Extension for easier localized strings.
extension String {
    static func localized(_ key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}
