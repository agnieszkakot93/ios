//
//  CurrentyWeatherViewModel.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject, Identifiable {
    
    // publisher property delegate makes possible to observe the city property
    @Published var dataSource: CurrentWeatherRowViewModel?
    
    let city: String
    private let weatherWorker: WeatherWorker
    
    private var disposables = Set<AnyCancellable>()
    
    init(city: String = "Warszawa", weatherWorker: WeatherWorker) {
        self.city = city
        self.weatherWorker = weatherWorker
    }
    
    func getCurrentWeather() {
        weatherWorker
            .dailyWeatherForecast(for: city)
            .map { response in
                return CurrentWeatherRowViewModel(rowModel: response)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.dataSource = nil
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] forecast in
                    guard let self = self else { return }
                    self.dataSource = forecast
                })
            .store(in: &disposables)
    }
}

extension CurrentWeatherViewModel {
    var roadRiskWeatherAlerts: some View {
        return WeatherDetailsViewBuilder.createRoadRiskWeatherAlertsView(city: city,
                                                                         weatherWorker: weatherWorker)
    }
}
