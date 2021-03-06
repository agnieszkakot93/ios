//
//  Parsing.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ErrorHandler> {
    let decoder = JSONDecoder()
    
    decoder.dateDecodingStrategy = .secondsSince1970
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
