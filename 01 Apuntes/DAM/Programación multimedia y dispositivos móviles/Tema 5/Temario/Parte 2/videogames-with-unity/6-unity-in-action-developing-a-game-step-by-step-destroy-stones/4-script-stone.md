# 4. Script Stone

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/4.-script-stone

In the previous video, random stones are generated. However, these stones **persist** and **remain** **active** even after they **fall** **out** of **camera's** **view**. Over time, this can lead to significant **memory** and **performance** **issues**.

In the next video, we will show you how to **automatically** **remove** a **stone** when it **reaches** a certain **y-axis threshold**, avoiding potential problems:

* Creating a **new** script **Stone.cs**
* **Assigning** it **to** all stone **prefabs**.

C# code for Stone.cs:

Copy

```
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stone : MonoBehaviour
{
    private const float yDie = -30.0f;

    // Start is called before the first frame update
    void Start() {
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.position.y < yDie) {
            Destroy(gameObject);
        }
    }
}
```

[Previous3. Time.timeScale](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/3.-time.timescale)[Next5. OnMouseDown](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/5.-onmousedown)

Last updated 1 year ago