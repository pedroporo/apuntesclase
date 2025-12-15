# 5. OnMouseDown

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/5.-onmousedown

In this video, we are **adding** to the game the **essential** **funtionality**: **destroy** the **stone** when the player **touches** it (mouse click or touch on screen).

To do this we are using event `OnMouseDown()`

Stone.cs (OnMouseDown added):

Copy

```
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stone : MonoBehaviour
{
    private const float yDie = -30.0f;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.position.y < yDie) {
            Destroy(gameObject);
        }

    }
    // destroy stone when is touched
    private void OnMouseDown() {
        Destroy(gameObject);
    }
}
```

[Previous4. Script Stone](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/4.-script-stone)[Next6. Prefab explosion](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/6.-prefab-explosion)

Last updated 1 year ago