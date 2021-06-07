//
//  SetupView.swift
//  ShiftLogger WatchKit Extension
//
//  Created by Jess Taylor on 6/5/21.
//

import SwiftUI
import Combine

struct SetupView: View {
    @EnvironmentObject private var settings: ShiftConfig

    @State var userInputHourly = ""
    @State var userInputDelivery = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    TextField("Hourly Rate:", text: $userInputHourly)
                        .onReceive(Just(userInputHourly)) { newValue in
                            if let hourly = Double(userInputHourly), hourly != settings.hourlyRate {
                                settings.hourlyRate = Double(hourly)
                            }
                        }
                    TextField("Delivery Rate:", text: $userInputDelivery)
                        .onReceive(Just(userInputDelivery)) { newValue in
                            if let delivery = Double(userInputDelivery), delivery != settings.deliveryRate {
                                settings.deliveryRate = Double(delivery)
                            }
                        }
                    NavigationLink(destination: MainMenu()) {
                                        Text("Save")
                                    }
                }
            }
        }
    }
}
