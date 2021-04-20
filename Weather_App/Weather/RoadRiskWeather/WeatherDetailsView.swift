//
//  RoadRiskWeatherViewModel.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import SwiftUI

struct WeatherDetailsView: View {
    @ObservedObject var viewModel: WeatherDetailsViewModel

    init(viewModel: WeatherDetailsViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        List(content: content)
            .onAppear(perform: viewModel.getAlerts)
            .navigationBarTitle(viewModel.city)
            .listStyle(GroupedListStyle())
    }
}

private extension WeatherDetailsView {
    func content() -> some View {
        if let viewModel = viewModel.dataSource {
            return AnyView(setView(with: viewModel))
        } else {
            return AnyView(isLoading)
        }
    }
    
    func setView(with viewModel: WeatherDetailsRowViewModel) -> some View {
        WeatherDetailsRow(viewModel: viewModel)
    }
    
    var isLoading: some View {
        Text("Loading alerts for \(viewModel.city)")
            .foregroundColor(.gray)
    }
}
