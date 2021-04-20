//
//  CurrentWeatherRowView.swift
//  Weather_App
//
//  Created by agnieszka.kot on 19/04/2021.
//

import SwiftUI

struct CurrentWeatherRowView: View {
    
    private let viewModel: CurrentWeatherRowViewModel
    
    init(viewModel: CurrentWeatherRowViewModel) {
        self.viewModel = viewModel
        
    }
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                VStack (alignment: .leading, spacing: 4) {
                    HStack {
                        Text("☀️ Temperature:")
                        Text("\(viewModel.minTemp)°")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("📈 Max temperature:")
                        Text("\(viewModel.maxTemp)°")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("📉 Min temperature:")
                        Text("\(viewModel.temp)°")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Feels Like: \(Image(systemName: "applelogo"))")
                        Text("\(viewModel.feelsLikeTemp)")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                }
            }
            Spacer(minLength: 50)
            
            GoogleMapView(coordinate: viewModel.coordinate)
                .cornerRadius(25)
                .frame(height: 300)
                .disabled(true)
        }
    }
}
