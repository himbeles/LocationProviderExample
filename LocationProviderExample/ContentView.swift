//
//  ContentView.swift
//  LocationProviderExample
//
//  Created by Luis on 06.09.20.
//

import SwiftUI
import LocationProvider

struct ContentView: View {
    @ObservedObject var locationProvider : LocationProvider
    
    init() {
        locationProvider = LocationProvider()
        do {try locationProvider.start()}
        catch {
            print("No location access.")
            locationProvider.requestAuthorization()
        }
    }

    var body: some View {
        VStack{
        Text("latitude \(locationProvider.location?.coordinate.latitude ?? 0)")
        Text("longitude \(locationProvider.location?.coordinate.longitude ?? 0)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
