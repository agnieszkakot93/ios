//
//  RoadRiskWeatherViewModel.swift
//  Weather_App
//
//  Created by agnieszka.kot on 20/04/2021.
//

import SwiftUI
import Combine

class WeatherDetailsViewModel: ObservableObject {
    @Published var dataSource: WeatherDetailsRowViewModel?

    let city: String
    
    private let weatherWorker: WeatherWorkerProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(city: String, weatherWorker: WeatherWorkerProtocol) {
        self.weatherWorker = weatherWorker
        self.city = city
    }
    
    func getAlerts() {
        weatherWorker
            .weatherDetailsForecast(for: city)
            .map(WeatherDetailsRowViewModel.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = nil
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] weather in
                guard let self = self else { return }
                self.dataSource = weather
            })
            .store(in: &disposables)
    }
}

