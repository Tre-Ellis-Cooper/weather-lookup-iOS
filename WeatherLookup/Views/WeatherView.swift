//
//  CityView.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

import SwiftUI


// Weather results view.
struct WeatherView: View {
    let model: WeatherViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: .zero) {
                    ForEach(model.entries, content: Row.init)
                }
            }
        }
        .navigationBarTitle(
            model.cityLabel,
            displayMode: .inline
        )
    }
    
    struct Row: View {
        let entry: WeatherViewModel.Entry
        
        var body: some View {
            NavigationLink(
                destination: WeatherDetailView(entry: entry)
            ) {
                VStack(spacing: .zero) {
                    Color.border
                        .frame(height: 1)
                    HStack {
                        if let category = entry.category {
                            Text(category)
                        }
                        Spacer()
                        Text(entry.tempLabel)
                    }
                    .font(.title3)
                    .padding(36)
                }
                .foregroundColor(.primaryText)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var model = WeatherViewModel(
        city: "New York",
        country: "US",
        entries: [
            WeatherDetailView_Previews.entry,
            WeatherDetailView_Previews.entry,
            WeatherDetailView_Previews.entry
        ]
    )
    
    static var previews: some View {
        WeatherView(model: model)
    }
}
