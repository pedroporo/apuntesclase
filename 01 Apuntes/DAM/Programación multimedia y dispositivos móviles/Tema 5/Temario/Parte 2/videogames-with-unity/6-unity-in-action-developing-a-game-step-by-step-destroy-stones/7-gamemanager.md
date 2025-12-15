# 7. GameManager

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/7.-gamemanager

In this video, we will **monitor** and **record** the number of **stones** that are both **thrown** and subsequently **destroyed**.

As this information is **global**, we will create a **static** class named `GameManager.cs` to access these values across the game.

GameManager.cs

Copy

```
public static class GameManager 
{
    public static int currentNumberStonesThrown = 0;
    public static int currentNumberDestroyedStones = 0;    
}
```

We'll **update** **scripts** accordingly:

* **MainLoop.cs:** Whenever a new stone is created, **increases** the count of stones **thrown**.
* **Stone.cs:** Whenever the player destroyes a stone , **increases** the count of stones **destroyed**.

[Previous6. Prefab explosion](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/6.-prefab-explosion)[Next8. UI (User Interface)](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/8.-ui-user-interface)

Last updated 1 year ago