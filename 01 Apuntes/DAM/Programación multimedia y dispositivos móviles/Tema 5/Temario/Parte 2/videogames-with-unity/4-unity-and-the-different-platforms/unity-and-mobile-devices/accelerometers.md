# Accelerometers

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/4.-unity-and-the-different-platforms/unity-and-mobile-devices/accelerometers

As a mobile device moves, its **accelerometer** **detects** **changes** in **linear acceleration** **across** its **three** primary **axes** in 3D space.

The data from accelerometer allows to determine the device's **orientation** and detect any **changes** to it.

## **Considerations when working with accelerator values:**

* **Acceleration** along an axis **is** **measured** **in** **G** units. **1 G = 9.81 m / s ^ 2**

  + A value of 1.0 represents a load of 1 gravity on that axis.
* The **accelerometer** **axes** are **aligned** with the **game's** **view** **orientation**. Therefore, it's essential to **define** the **orientation** settings specified in 'Player Settings' (e.g., **landscape**, **portrait**) to understand the correct alignment of the X, Y, and Z axes.

  + For example, if we have selected ‘portrait’, holding the device in its original vertical position (with the screen facing the user), the X axis is positive to the right, the Y axis is positive directly up and the Z axis is positive towards the user

![](https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/~gitbook/image?url=https%3A%2F%2Fcourses.edx.org%2Fassets%2Fcourseware%2Fv1%2F9470572cc111e81b40caf296a022ae4f%2Fasset-v1%3AUPValenciaX%2BUNYEN201X%2B1T2022%2Btype%40asset%2Bblock%2Fmobileaxes.png&width=768&dpr=4&quality=100&sign=a47f2957&sv=2)

* Use **Input.acceleration** to read acceleration data across the 3 axes.
* Use **Input.deviceOrientation** to get a discrete device orientation, specifically an enumeration of the **DeviceOrientation** type: **FaceDown**, **FaceUp**, **LandscapeLeft**, **LandscapeRight**, **Portrait**, **PortraitUpsideDown**, **Unknown.**

[PreviousSetting up iOS](/videogames-with-unity/4.-unity-and-the-different-platforms/unity-and-mobile-devices/setting-up-ios)[NextMobile version using Accelerometers](/videogames-with-unity/4.-unity-and-the-different-platforms/unity-and-mobile-devices/mobile-version-using-accelerometers)

Last updated 1 year ago