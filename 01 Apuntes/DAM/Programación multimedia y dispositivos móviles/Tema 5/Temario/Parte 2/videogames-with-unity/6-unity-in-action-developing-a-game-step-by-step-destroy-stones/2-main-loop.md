# 2. Main loop

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/2.-main-loop

The following video explains the structure of the script **MainLoop.cs:**

* This script is responsible of creating the stones in real-time: randomly **instantiates** **stone** **prefabs** (from an array of gameobjects) **and** **throw** them **from** **bottom** **to** **top** of the **screen**.
* All the work is done in a **coroutine**  that **controls** when (random **timing**), where (random **position**) and how (ramdom **impulse** force and random **rotation**) the stones are instantiated.

[Previous1. Folders and prefabs](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/1.-folders-and-prefabs)[Next3. Time.timeScale](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/3.-time.timescale)

Last updated 1 year ago