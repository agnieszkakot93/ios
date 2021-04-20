//
//  CurrentWeatherCellViewModel.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import Foundation
import MapKit

struct CurrentWeatherRowViewModel {
    let rowModel: GetCurrentWeatherResponse
    
    var title: String {
        "Warszawa"
    }
    var maxTemp: String {
        return  String(format: "%.1f", rowModel.main.maxTemperature)
    }
    var temp: String {
        return String(format: "%.1f", rowModel.main.temperature)
    }
    var minTemp: String {
        return String(format: "%.1f", rowModel.main.minTemperature)
    }
    var feelsLikeTemp: String {
        return String(format: "%.1f", rowModel.main.feelsLike)
    }
    
    var coordinate: CLLocationCoordinate2D {
      return CLLocationCoordinate2D.init(latitude: rowModel.coord.lat, longitude: rowModel.coord.lon)
    }
}
