//
//  ShiftSettings.swift
//  ShiftLogger WatchKit Extension
//
//  Created by Jess Taylor on 6/5/21.
//

import Foundation

class ShiftConfig: ObservableObject {
    @Published var hourlyRate: Int = 0
    @Published var deliveryRate: Int = 0
    
    func setupComplete() -> Bool {
        if hourlyRate > 0 && deliveryRate > 0 {
            return true
        } else {
            return false
        }
    }
}
