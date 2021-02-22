//
//  SearchView.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

import SwiftUI


// Weather search view.
struct SearchView: View {
    @ObservedObject var loader: WeatherLoader
    @State private var result: WeatherViewModel?
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            InputView(
                placeholder: .localized("City_Name"),
                onCommit: loadSearch
            )
            .padding(.horizontal, 48)
            VStack {
                Spacer()
                AccessoryView(state: loader.state)
            }
        }
        .navigate(
            using: $result,
            destination: WeatherView.init
        )
        .onReceive(loader.$state) {
            if case .success(let value) = $0 {
                result = value
            }
        }
    }
    
    private func loadSearch(_ search: String) {
        loader.loadCurrentWeather(cityName: search)
    }
    
    private struct InputView: View {
        let placeholder: String
        let onCommit: (String) -> Void
        
        @State private var search: String = ""
        
        var body: some View {
            VStack(spacing: 36) {
                VStack(spacing: .zero) {
                    TextField(placeholder, text: $search)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 12)
                    Color.border
                        .frame(height: 1)
                }
                Button(action: onSearch) {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.border, lineWidth: 1)
                        .frame(height: 55)
                        .overlay(
                            Text(verbatim: .localized("Lookup"))
                        )
                }
                .foregroundColor(.primaryText)
                .padding(.horizontal, 36)
            }
            .font(.title3)
        }
        
        private func onSearch() {
            onCommit(search)
        }
    }
    
    private struct AccessoryView: View {
        let state: WeatherLoader.State
        
        var body: some View {
            switch state {
            case .initial:
                EmptyView()
            case .loading:
                ProgressView()
            case .failure:
                Text(verbatim: .localized("Error_Retry"))
                    .foregroundColor(.highlight)
            case .success:
                EmptyView()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(loader: .init())
    }
}
