# 6. Prefab explosion

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/6.-prefab-explosion

The next video will **enhance** **realism** in the game by **showing** an **explosion** when the **stone** is **destroyed:**

* **Instantiating** a **prefab** that contains a **particle** **system** that simulates **explosion**,
* To avoid preformance issues, the **explosion** **is** **destroyed** after **2** **seconds.**

Stone.cs (with explosion):

Copy

```
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stone : MonoBehaviour
{
    public GameObject explosion;
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
    // show explosion and destroy it after 2 sec
    private void OnMouseDown() {
        Destroy(Instantiate(explosion, transform.position, Quaternion.identity), 2.0f);
        Destroy(gameObject);
    }
}
```

A **particle system** in Unity is a powerful tool for creating dynamic and realistic effects in games. It simulates and renders many small images or meshes, called **particles**, to produce visual effects like moving liquids, smoke, clouds, flames, magic spells, and more. [Each particle represents an individual graphical element in the effect, and collectively, they create the impression of the complete effect](https://learn.unity.com/tutorial/introduction-to-particle-systems)

[Previous5. OnMouseDown](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/5.-onmousedown)[Next7. GameManager](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/7.-gamemanager)

Last updated 1 year ago