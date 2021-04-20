//
//  RoadRiskWeatherRowViewModel.swift
//  Weather_App
//
//  Created by agnieszka.kot on 19/04/2021.
//

import SwiftUI

struct WeatherDetailsRowViewModel {
    private let item: GetDetailsWeather
    
    var sunrise: String {
        return dateFormatter.string(from: item.city.sunrise)
    }

    var sunset: String {
        return dateFormatter.string(from: item.city.sunset)
    }
    
    var country: String {
        return String(item.city.country)
    }
    
    init(item: GetDetailsWeather) {
      self.item = item
    }
}
