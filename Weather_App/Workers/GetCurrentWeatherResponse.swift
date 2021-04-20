//
//  GetCurrentWeatherResponse.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import Foundation

// MARK: - GetCurrentWeatherResponse
struct GetCurrentWeatherResponse: Decodable {
    let coord: CoordDTO
    let main: MainDTO
    
    struct MainDTO: Codable {
        let temperature: Double
        let humidity: Int
        let maxTemperature: Double
        let minTemperature: Double
        let feelsLike: Double
        
        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case humidity
            case maxTemperature = "temp_max"
            case minTemperature = "temp_min"
            case feelsLike = "feels_like"
        }
    }
    
    struct CoordDTO: Codable {
        let lon: Double
        let lat: Double
    }
}
