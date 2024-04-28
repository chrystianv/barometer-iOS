//
//  ContentView.swift
//  Barometer iOS
//
//  Created by Chrystian Vieyra on 4/28/24.
//

import SwiftUI
import CoreMotion

struct ContentView: View {

    let altimeter = CMAltimeter()
    @State var pressureData: String = "No Data"

    var body: some View {
        VStack {
            Text(pressureData)
                .padding()
            Button(action: {
                // Trigger the sensor permission and begin receiving updates - only needed on iOS 17.4 and newer
                triggerSensor()
            }) {
                Text("Start Measuring Barometric Pressure")
            }
        }
    }

    func triggerSensor() {
        let status = CMAltimeter.authorizationStatus()
        let recorder = CMSensorRecorder()
        recorder.recordAccelerometer(forDuration: 0.1)

        switch status {
        case .notDetermined:
            // Trigger a recorder to popup authorization - could not find another way to trigger the prompt
            let recorder = CMSensorRecorder()
            DispatchQueue.main.async {
                self.pressureData = "Trigerring permission prompt…"
                recorder.recordAccelerometer(forDuration: 0.1)
            }
            
            // Start getting readings
            if CMAltimeter.isRelativeAltitudeAvailable() {
                altimeter.startRelativeAltitudeUpdates(to: .main) { (data, error) in
                    DispatchQueue.main.async {
                        self.pressureData = "\(data?.pressure ?? 0)"
                    }
                }
            }
            
        case .restricted:
            DispatchQueue.main.async {
                self.pressureData = "Fitness Tracking Required: Please enable in the Settings app."
            }
            
        case .denied:
            DispatchQueue.main.async {
                self.pressureData = "Motion & Fitness Required: Please enable in the app settings."
            }
            
        default:
            print("Authorized – starting barometer...")
            if CMAltimeter.isRelativeAltitudeAvailable() {
                altimeter.startRelativeAltitudeUpdates(to: .main) { (data, error) in
                    DispatchQueue.main.async {
                        self.pressureData = "\(data?.pressure ?? 0)"
                    }
                }
            }
            
        }
    }
}
