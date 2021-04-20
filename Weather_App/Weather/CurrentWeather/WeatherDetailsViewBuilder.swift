//
//  RoadRiskAlertsViewBuilder.swift
//  Weather_App
//
//  Created by agnieszka.kot on 20/04/2021.
//

import SwiftUI

enum WeatherDetailsViewBuilder {
    static func createRoadRiskWeatherAlertsView(city: String,
                                              weatherWorker: WeatherWorker) -> some View {
        let viewModel = WeatherDetailsViewModel(city: city, weatherWorker: weatherWorker)

    return WeatherDetailsView(viewModel: viewModel)
  }
}
