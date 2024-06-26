//
//  ContentView.swift
//  SimpleWeather
//
//  Created by Юрий on 10.05.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(WeatherViewModel.self) private var weatherManager
    
    var body: some View {
        if let error = weatherManager.error {
            ErrorView(error)
        } else {
            VStack {
                if weatherManager.locationManager.isLoading {
                    LoadingView()
                } else  {
                    if weatherManager.userWeather != nil {
                        MainWeatherView()
                    } else {
                        LoadingView()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(previewWeatherViewModel)
}
