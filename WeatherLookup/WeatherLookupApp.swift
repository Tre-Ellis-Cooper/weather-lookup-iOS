//
//  WeatherLookupApp.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/21/21.
//

import SwiftUI

@main
struct WeatherLookupApp: App {
    init() {
        let appearance = UINavigationBarAppearance {
            $0.configureWithOpaqueBackground()
            $0.backgroundColor = .init(.highlight)
            $0.titleTextAttributes = [
                .foregroundColor: UIColor(.secondaryText)
            ]
        }

        UINavigationBar.configure {
            $0.standardAppearance = appearance
            $0.scrollEdgeAppearance = appearance
            $0.compactAppearance = appearance
            $0.tintColor = .init(.secondaryText)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WeatherLoader())
        }
    }
}

extension UINavigationBarAppearance {
    convenience init(
        configure: (UINavigationBarAppearance) -> Void
    ) {
        self.init()
        configure(self)
    }
}

extension UINavigationBar {
    static func configure(
        configure: (UINavigationBar) -> Void
    ) {
        configure(appearance())
    }
}
