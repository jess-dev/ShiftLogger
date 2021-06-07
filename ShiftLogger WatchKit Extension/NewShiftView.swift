//
//  NewShiftView.swift
//  ShiftLogger WatchKit Extension
//
//  Created by Jess Taylor on 6/6/21.
//

import SwiftUI

struct NewShiftView: View {
    @EnvironmentObject private var settings: ShiftConfig
    
    
    
    var body: some View {
        Text("Hourly rate : £\(settings.hourlyRate, specifier: "%.2f")")
        Text("Delivery rate : £\(settings.deliveryRate, specifier: "%.2f")")
        NavigationLink(destination: ActiveShiftView()) {
                            Text("Start Shift")
                        }
    }
}

struct NewShiftView_Previews: PreviewProvider {
    static var previews: some View {
        NewShiftView()
    }
}
