## Barometer iOS repo!

This simplistic **SwiftUI app** is capable of accessing and displaying data from the barometer sensor inside **iOS devices**. 

The app works on iOS 17.4 and newer versions. However, it requires "Motion & Fitness" permissions to be granted for successful retrieval of barometer sensor data. In this app, we trigger the prompt for the "Motion & Fitness" settings via a 0.1 second ﻿CMSensorRecorder call.


# Key to request the prompt:

 let recorder = CMSensorRecorder()
            DispatchQueue.main.async {
                self.pressureData = "Trigerring permission prompt…"
                recorder.recordAccelerometer(forDuration: 0.1)
            }


![Sensor Prompt Screenshot](https://github.com/chrystianv/barometer-iOS/blob/main/Barometer%20iOS/sensor%20prompt.png)


![Needed fitness tracking setting](https://github.com/chrystianv/barometer-iOS/blob/main/Barometer%20iOS/fitness%20tracking.png)


