## Barometer iOS repo!

This simplistic **SwiftUI app** is capable of accessing and displaying data from the barometer sensor inside **iOS devices**. 

The app works on iOS 17.4 and newer versions. However, it requires "Motion & Fitness" permissions to be granted for successful retrieval of barometer sensor data. In this app, we trigger the prompt for the "Motion & Fitness" settings via a 0.1 second ﻿CMSensorRecorder call.


<img src="https://github.com/chrystianv/barometer-iOS/blob/main/Barometer%20iOS/sensor%20prompt.png" alt="Sensor Prompt Screenshot" width="20%" height="20%"> <img src="https://github.com/chrystianv/barometer-iOS/blob/main/Barometer%20iOS/fitness%20tracking.png" alt="Needed fitness tracking setting" width="20%" height="20%">


# Key to request the prompt:

```swift
let recorder = CMSensorRecorder()
DispatchQueue.main.async {
    self.pressureData = "Trigerring permission prompt…"
    recorder.recordAccelerometer(forDuration: 0.1)
}

and to add Privacy - Motion Usage Description in the info.plist


