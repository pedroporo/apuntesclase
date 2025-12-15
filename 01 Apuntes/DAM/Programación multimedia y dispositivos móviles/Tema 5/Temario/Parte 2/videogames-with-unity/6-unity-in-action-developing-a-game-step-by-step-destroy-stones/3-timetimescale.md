# 3. Time.timeScale

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/3.-time.timescale

In this video, we'll guide you through the process of making stones appear in your scene using the script we created previously:

* Assign **MainLoop** script to Main Camera
* Drag & Drop Stone1, Stone3, Stone3 prefabs to the **array** of Stones of the script.
* Set up Main Camera properties: **Z** position = **-120** (far away), **Clipping Planes-> Far = 200**, FieldOfView (**FOV**) = **25.**
* Make the game go at faster speed:

  Edit -> Project Settings-> Time -> **Time** **Scale** = **3** (three times faster).

In Unity, the Field of View (**FOV**) of a camera determines the **extent** of the **observable** **world** that is seen on the screen at once. [When you decrease the FOV, the camera’s perspective becomes more “zoomed in” or narrower](https://docs.unity3d.com/Manual/CamerasOverview.html)

[Previous2. Main loop](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/2.-main-loop)[Next4. Script Stone](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/4.-script-stone)

Last updated 1 year ago