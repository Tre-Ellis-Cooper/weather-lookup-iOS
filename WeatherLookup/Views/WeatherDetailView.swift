//
//  WeatherDetailView.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

import SwiftUI


// Detailed weather results view.
struct WeatherDetailView: View {
    let entry: WeatherViewModel.Entry
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 48) {
                Text("\(entry.temp)")
                    .font(.system(size: 80))
                HStack {
                    Spacer()
                    Text(entry.feelsLikeLabel)
                }
                VStack(alignment: .leading, spacing: 24) {
                    if let category = entry.category {
                        Text(category)
                            .font(.system(size: 38))
                    }
                    if let detail = entry.detail {
                        Text(detail)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.system(size: 24))
            .padding(24)
        }
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var entry = WeatherViewModel.Entry(
        temp: 60,
        feelsLike: 58,
        category: "Rain",
        detail: "Slight drizzle."
    )
    
    static var previews: some View {
        WeatherDetailView(entry: entry)
    }
}
