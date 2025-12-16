# 10. Initial Scene: Programming button On Click

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/10.-initial-scene-programming-button-on-click

In the next video, we will learn how to **setup** the initial scene: **Awake.**

The **initial** **scene** serves as the starting point of the game, featuring background music, settings, and various buttons to perform actions, such a **button** to **start** **playing** the game.

The Awake scene is very simple: it contains a "**Play**" button. When the player clicks on it, the StoneGame scene is loaded into memory, and all resources from the current scene are unloaded.

These are the **steps**:

1. Add to the Awake scene a "**Play**" Button.

**Choose:** **Button - TextMeshPro**

1. Create a **new** **script** **InterfaceAwake.cs** and program everything needed to start the game:

   1. **Reset** GameManager **counters** to zero,
   2. **Create** a public **method** **Click()**, that **loads** the StoneGame scene.
2. **Assign** the new **script** to **Canvas**.
3. **Setup** "**Play**" button (so Click() method is called when user clicks play):

   1. Drag&Drop **Canvas** to **On Click** **button** property,
   2. From the list, find **InterfaceAwake** class and choose **Click** method.

**InterfaceAwake.cs**

```
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class InterfaceAwake : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        GameManager.currentNumberStonesThrown = 0;
        GameManager.currentNumberDestroyedStones = 0;
    }

    public void Click() {
        SceneManager.LoadScene("StoneGame");
    }
}
```

##

[Previous9. Adding Scenes](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/9.-adding-scenes)[Next11. Final Scene: Showing game results](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/11.-final-scene-showing-game-results)

Last updated 1 year ago