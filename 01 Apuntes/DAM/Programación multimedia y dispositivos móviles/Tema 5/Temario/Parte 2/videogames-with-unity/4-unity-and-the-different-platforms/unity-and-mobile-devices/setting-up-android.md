# Setting up Android

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/4.-unity-and-the-different-platforms/unity-and-mobile-devices/setting-up-android

In order to deploy Unity application on an Android device you must **add** the **Android Build Support** module to Unity, that downloads the **Android** **SDK** and any necessary **components**.

Including the **Android platform** module with Unity is **strongly advised** during setup, but it's possible to add it later:

![](https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/~gitbook/image?url=https%3A%2F%2F1783396225-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FdRlCVp8VBZ34m99uWkGs%252Fuploads%252FaGJGBcwapLrnE7uAGUzO%252Fimage.png%3Falt%3Dmedia%26token%3D5d89a1fa-72e1-43ec-b108-b50df351776d&width=768&dpr=4&quality=100&sign=eae035d2&sv=2)

Add modules to a Unity install

![](https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/~gitbook/image?url=https%3A%2F%2F1783396225-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FdRlCVp8VBZ34m99uWkGs%252Fuploads%252FGlYfN6yGvMBrGMQNNytO%252Fimage.png%3Falt%3Dmedia%26token%3D027fc28d-84b1-45ee-a685-5f7b466d23d2&width=768&dpr=4&quality=100&sign=e66631ca&sv=2)

Android Build Support Added

In Windows, certain devices may require installation of specific **drivers** provided by the **device manufacturer**. This process can sometimes be complex for specific models.

## Deploying to Android device

First, you must enable **USB Debugging** on your **Android** **device**. Follow these **steps**:

1. Navigate to **Settings** -> **System** -> **About phone**.
2. Tap **Build number** several times until you see a message that says *"You are now a developer!"*
3. Go back to **Settings** -> **System**. You should now see **Developer options**.
4. In **Developer options**, scroll down and **toggle** **on** **USB Debugging** option.

Then, open **Build** **Settings** to **deploy** Unity application to Android device. You can choose between two options:

* **Build ->**Generates the **.apk** file, and then, you must manually install it on the device.
* **Build & Run** -> The game launches directly, running on the device.

Device compatibility and ease of deployment may vary depending on your Android device's model. Unity follows similar deployment steps required for developing Android applications using the official development tools.

For further information and **problem**-**solving** tips regarding Android deployment in Unity, consult the official Unity manual.

<https://docs.unity3d.com/Manual/android.html>

[PreviousUnity and Mobile devices](/videogames-with-unity/4.-unity-and-the-different-platforms/unity-and-mobile-devices)[NextSetting up iOS](/videogames-with-unity/4.-unity-and-the-different-platforms/unity-and-mobile-devices/setting-up-ios)

Last updated 1 year ago