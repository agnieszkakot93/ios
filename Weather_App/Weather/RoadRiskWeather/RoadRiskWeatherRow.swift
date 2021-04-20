//
//  RoadRiskWeatherRowView.swift
//  Weather_App
//
//  Created by agnieszka.kot on 20/04/2021.
//

import SwiftUI

struct RoadRiskWeatherAlertsRow: View {
    private let viewModel: RoadRiskWeatherRowViewModel

    init(viewModel: RoadRiskWeatherRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.title)
                .font(.headline)
            Spacer().frame(height: 15)
            Text(viewModel.alertEvent)
        }
    }
}
