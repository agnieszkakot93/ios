//
//  Formatter.swift
//  Weather_App
//
//  Created by agnieszka.kot on 19/04/2021.
//

import Foundation

let tempFormatter: MeasurementFormatter = {
  let formatter = MeasurementFormatter()
  formatter.locale = Locale(identifier: "en_GB")
  return formatter
}()


let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YY, MMM d, HH:mm:ss"
    return dateFormatter
}()
