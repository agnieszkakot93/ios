//
//  CurrentWeatherView.swift
//  Weather_App
//
//  Created by agnieszka.kot on 19/04/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: CurrentWeatherViewModel
    @State var isLinkActive = false

    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(content: content)
                    .onAppear(perform: viewModel.getCurrentWeather)
                    .navigationBarTitle(viewModel.city)
                NavigationLink(destination: viewModel.roadRiskWeatherAlerts, isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        HStack {
                            Text("Show alerts")
                                .fontWeight(.semibold)
                                .font(.body)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    }
                }
            }
        }.navigationBarTitle("Warszawa")
    }
}

private extension CurrentWeatherView {
    func content() -> some View {
        if let viewModel = viewModel.dataSource {
            return AnyView(attributes(for: viewModel))
        } else {
            return AnyView(isLoaderVisible)
        }
    }
    
    func attributes(for viewModel: CurrentWeatherRowViewModel) -> some View {
        CurrentWeatherRowView(viewModel: viewModel)
    }
    
    var isLoaderVisible: some View {
        Text("Loading data for \(viewModel.city)")
            .foregroundColor(.blue)
    }
    
}
