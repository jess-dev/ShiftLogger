//
//  ActiveShiftView.swift
//  ShiftLogger WatchKit Extension
//
//  Created by Jess Taylor on 6/6/21.
//

import SwiftUI

struct ActiveShiftView: View {
    @State var currentDate = Date()
    
    @State var hours: Int = 0
      @State var minutes: Int = 0
      @State var seconds: Int = 0
    @State var deliveries: Int = 0
    
    @State var finishedHrs: Int = 0
    @State var finishedMins: Int = 0
    
    @State var timer: Timer? = nil
    
    @State var timerActive: Bool = false
    @State var shiftFinished: Bool = false

        var body: some View {
            if(shiftFinished == false) {
                    HStack{
                        Text("Deliveries : \(deliveries)")
                        Button(action:{
                            self.deliveries += 1
                        }){
                          Image(systemName: "plus.app")
                            .padding(.all)
                        }
                    }
                    Text("\(hours) hrs : \(minutes) mins")
                    VStack {
                        if(timerActive == false) {
                            Button(action:{
                              self.startTimer()
                            }){
                              Image(systemName: "play.fill")
                                .padding(.all)
                            }
                        } else {
                            Button(action:{
                                      self.stopTimer()
                                    }){
                                      Image(systemName: "stop.fill")
                                        .padding(.all)
                                    }
                        }
                    }
            } else {
                Text("Shift finished!")
                Text(" \(finishedHrs) hrs and \(finishedMins) mins")
                Text("Deliveries : \(deliveries)")
            }
        }
    
    func stopTimer(){
        timerActive = false
        finishedHrs = self.hours
        finishedMins = self.minutes
        shiftFinished = true
        timer?.invalidate()
        timer = nil
      }
    
    func startTimer(){
        timerActive  = true
        // 1. Make a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
          // 2. Check time to add to H:M:S
          if self.seconds == 59 {
            self.seconds = 0
            if self.minutes == 59 {
              self.minutes = 0
              self.hours = self.hours + 1
            } else {
              self.minutes = self.minutes + 1
            }
          } else {
            self.seconds = self.seconds + 1
          }
        }
      }
}

struct ActiveShiftView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveShiftView()
    }
}
