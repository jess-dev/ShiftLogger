//
//  ContentView.swift
//  ShiftLogger WatchKit Extension
//
//  Created by Jess Taylor on 6/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var settings = ShiftConfig()
    
    var body: some View {
        MainMenu().environmentObject(settings)
    }
}
