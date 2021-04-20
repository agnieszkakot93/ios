//
//  GetRoadRiskWeatherResponse.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//


import Foundation

// MARK: - Welcome
struct GetDetailsWeather: Decodable {
    let cod: String
    let message: Double
    let cnt: Int
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let country: String
    let timezone: Int
    let sunrise: Date
    let sunset: Date
}
