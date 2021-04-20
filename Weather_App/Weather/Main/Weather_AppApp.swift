//
//  Weather_AppApp.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import SwiftUI

@main
struct Weather_AppApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherWorker = WeatherWorker()
            let viewModel = CurrentWeatherViewModel(weatherWorker: weatherWorker)
            CurrentWeatherView(viewModel: viewModel)

        }
    }
}
