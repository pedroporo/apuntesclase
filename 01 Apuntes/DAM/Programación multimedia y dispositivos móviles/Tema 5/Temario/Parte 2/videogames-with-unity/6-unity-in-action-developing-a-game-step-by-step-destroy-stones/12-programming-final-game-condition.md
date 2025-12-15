# 12.  Programming final game condition

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/12.-programming-final-game-condition

The next video introduces the **logic** that **controls** the **end** **of** **the game** and triggers the **loading** the **FinalScene:**

1. Open **StoneGame** Scene.
2. Edit **MainLoop** script.
3. In the coroutine **ThrowStones,** add the following **condition** within the while loop:

Copy

```
// remember to add:
using UnityEngine.SceneManagement;

IEnumerator ThrowStones()
{		
	// ...
	while(enableStones) {
		if (GameManager.currentNumberStonesThrown == 20) {
			SceneManager.LoadScene("Final");
		}
		//.......	
	}
}
```

[Previous11. Final Scene: Showing game results](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/11.-final-scene-showing-game-results)[Next13. Build Settings: Game Configuration](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/13.-build-settings-game-configuration)

Last updated 1 year ago