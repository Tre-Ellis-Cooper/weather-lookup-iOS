//
//  Extensions.swift
//  WeatherLookup
//
//  Created by Tre Cooper on 2/22/21.
//

import SwiftUI


// Extension to assist with navigating swiftui
// views programmatically.
extension View {
    @ViewBuilder
    func navigate<Value, Destination: View>(
        using binding: Binding<Value?>,
        @ViewBuilder destination: (Value) -> Destination
    ) -> some View {
        background(NavigationLink(binding, destination: destination))
    }
}

extension NavigationLink where Label == EmptyView {
    init?<Value>(
        _ binding: Binding<Value?>,
        @ViewBuilder destination: (Value) -> Destination
    ) {
        guard let value = binding.wrappedValue else {
            return nil
        }

        let isActive = Binding(
            get: { true },
            set: { if !$0 { binding.wrappedValue = nil } }
        )

        self.init(
            destination: destination(value),
            isActive: isActive,
            label: EmptyView.init
        )
    }
}
