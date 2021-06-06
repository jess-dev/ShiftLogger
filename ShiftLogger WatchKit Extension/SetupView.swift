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
                            if let hourly = Int(userInputHourly), hourly != settings.hourlyRate {
                                settings.hourlyRate = Int(hourly)
                            }
                        }
                    TextField("Delivery Rate:", text: $userInputDelivery)
                        .onReceive(Just(userInputDelivery)) { newValue in
                            if let delivery = Int(userInputDelivery), delivery != settings.deliveryRate {
                                settings.deliveryRate = Int(delivery)
                            }
                        }
                    NavigationLink(destination: MainMenu()) {
                                        Text("Save")
                                    }
                    Button("Print", action:{
                        print("Delivery : \(settings.deliveryRate)")
                        print("Hourly : \(settings.hourlyRate)")
                    })
                }
            }
        }
    }
}
