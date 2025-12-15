# Proposed Exercises

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/3.-the-unity-physics-engine/proposed-exercises

**Remember**, **experimentation** **is** **the** **key**!

Adjust parameters, observe results, and fine-tune your physics interactions to achieve the desired gameplay experience. 🚀🔍🎮

## **Exercise 1: Test Drag & Angular Drag**

Investigate the effects of varying the “Drag” and “Angular Drag” properties on the sphere:

* Adjust the “**Drag**” and “**Angular** **Drag**” values for the sphere’s **Rigidbody** component.
* **Observe** how these changes impact the sphere’s **movement** **behavior**, especially when it’s rolling or sliding:

  + Higher drag values will slow down the sphere’s movement, while lower values allow it to move more freely.
  + Angular drag affects the sphere’s rotation due to forces like torque.
* Test **different** combinations of **values** to find the desired behavior.

## **Exercise 2: Experiment with Jumping Force**

Explore the impact of varying the **value** of **jumping** **force** applied to our sphere. Test different force values and observe how high the sphere jumps:

* Too much force may lead to unrealistic jumps, while too little force might make the sphere barely leave the ground.
* Find a balance that feels natural and fits your game mechanics.

## **Exercise 3: Mass and Collision Effects**

Investigate how the **mass** **value** for the **sphere** interact with external forces during collisions:

* Try **different** **mass** **values** for the sphere, heavier or lighter.
* Create a pile of cubes in the scene.
* Apply forces (e.g., gravity, impulse) to the sphere and observe the consequences when it collides with the cube pile:

  + **Heavier Sphere**:

    - Requires a higher jump force value to overcome its weight.
    - Applies more force to the cubes, potentially causing them to scatter or fall.
  + **Lighter Sphere**:

    - May bounce off the cubes more easily due to their lower mass.
* **Observe** how mass affects gameplay and realism.

[PreviousFirst Example with Physics](/videogames-with-unity/3.-the-unity-physics-engine/first-example-with-physics)[Next4. Unity and the different platforms](/videogames-with-unity/4.-unity-and-the-different-platforms)

Last updated 1 year ago