# 14. Playing game on mobile device

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/14.-playing-game-on-mobile-device

We do not have to do anything special to our game to execute on mobile platforms, since **OnMouseDown** works on touch devices.

However, **to** **allow** players to use **multiple** **fingers** **simultaneously** to destroy stones (**multi**-**touch**), it's convenient to use `Input.touchCount` (the number of simultaneous touches) and iterate through them using the `Input.touches` array to manage them properly.

[Previous13. Build Settings: Game Configuration](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/13.-build-settings-game-configuration)[NextProposed Exercises](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/proposed-exercises)

Last updated 1 year ago