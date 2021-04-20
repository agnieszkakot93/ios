//
//  RoadRiskWeatherRowView.swift
//  Weather_App
//
//  Created by agnieszka.kot on 20/04/2021.
//

import SwiftUI

struct WeatherDetailsRow: View {
    private let viewModel: WeatherDetailsRowViewModel

    init(viewModel: WeatherDetailsRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("🌅 Sunrise:")
                Text("\(viewModel.sunrise)")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("🌇 Sunset:")
                Text("\(viewModel.sunset)")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("⏱️ Country:")
                Text("\(viewModel.country)")
                    .foregroundColor(.gray)
            }
        }
    }
}

