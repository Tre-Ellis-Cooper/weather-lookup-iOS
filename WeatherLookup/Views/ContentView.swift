//
//  ContentView.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/21/21.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var loader: WeatherLoader
    
    var body: some View {
        NavigationView {
            SearchView(loader: loader)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
            .environmentObject(WeatherLoader())
    }
}
