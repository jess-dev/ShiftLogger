import SwiftUI

struct MainMenu: View {
    
    @EnvironmentObject var settings: ShiftConfig
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: NewShiftView().environmentObject(settings)) {
                                        Text("New Shift")
                                    }.disabled(!settings.setupComplete())
                    
                }
                HStack {
                    NavigationLink(destination: SetupView().environmentObject(settings)) {
                                        Text("Setup")
                                    }
                }
            }
        }
        .navigationBarHidden(true)
        .environmentObject(settings)
    }
    
    func newShift() {
        print("\(settings.deliveryRate)")
        print("\(settings.hourlyRate)")
    }
    
    func setup() {
        print("Setup")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
