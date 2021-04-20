//
//  ErrorHandler.swift
//  Weather_App
//
//  Created by agnieszka.kot on 18/04/2021.
//

import Foundation

enum ErrorHandler: Error {
    case parsing(description: String)
    case network(description: String)
}
