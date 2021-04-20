//
//  GetWeatherRequest.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import Foundation
import Combine

protocol WeatherWorkerProtocol {
    func dailyWeatherForecast(for city: String) -> AnyPublisher<GetCurrentWeatherResponse, ErrorHandler>
    func weatherDetailsForecast(for city: String) -> AnyPublisher<GetDetailsWeather, ErrorHandler>
}

final class WeatherWorker {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension WeatherWorker: WeatherWorkerProtocol {
    func dailyWeatherForecast(for city: String) -> AnyPublisher<GetCurrentWeatherResponse, ErrorHandler> {
        return forecast(with: makeDailyWeatherForecast(with: city))
    }
    
    func weatherDetailsForecast(for city: String) -> AnyPublisher<GetDetailsWeather, ErrorHandler> {
        return forecast(with: makeWeatherDetailsForecast(with: city))
    }
}

private extension WeatherWorker {
    var apiKey: String  {
        if let key = Bundle.main.infoDictionary?["API_KEY"] as? String {
            return  key
        }
        return ""
    }
    
    func forecast<T>(
        with components: URLComponents
    ) -> AnyPublisher<T, ErrorHandler> where T: Decodable {
        guard let url = components.url else {
            let error = ErrorHandler.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    func makeDailyWeatherForecast(with city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherApi.scheme
        components.host = OpenWeatherApi.host
        components.path = OpenWeatherApi.path + "/weather"
        
        components.queryItems = [
            URLQueryItem(name: "q", value: "Warszawa"),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherApi.key),
        ]
        
        return components
    }
    
    func makeWeatherDetailsForecast(with city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherApi.scheme
        components.host = OpenWeatherApi.host
        components.path = OpenWeatherApi.path + "/forecast"
        
        components.queryItems = [
            URLQueryItem(name: "q", value: "Warszawa"),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherApi.key)
        ]
        return components
    }
}

struct OpenWeatherApi {
    static let scheme = "https"
    static let host = "api.openweathermap.org"
    static let path = "/data/2.5"
    static let key = "" // needs to be provided
}
