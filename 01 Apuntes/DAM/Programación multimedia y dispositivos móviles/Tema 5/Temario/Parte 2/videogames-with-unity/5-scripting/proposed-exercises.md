# Proposed Exercises

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/5.-scripting/proposed-exercises

## Exercise 1. Updating the Sphere: Implementing Health

To further develop the sphere's interaction within the scene environment introduce a **health** **attribute**. This enhancement allows the sphere to have a quantifiable state of existence, **deteriorating** **upon** **collisions** **with** objects, specifically **cubes**.

Follow these **steps** to integrate this new feature:

1. **Add Health Attribute**: Declare an integer attribute for health in the sphere's properties. For example:

   Copy

   ```
   int healthLevel = 100;
   ```
2. **Collision with cube**:

   1. **Reduce Life**: When the sphere collides with a cube, the sphere's **life** **decreases** by one unit.
   2. **Health Check**: After each collision, check the sphere's health. If the health level reaches zero, print out a message to the console "The sphere is dead"

👾 The health attribute not only adds complexity to the sphere's interaction with the environment but also provides ideas for further development, such as health regeneration, damage modifiers, and more.

## Exercise 2: Spawning also Capsules

Modify the coroutine so it randomly **creates** either **cubes** or **capsules**, and ensure both object types are destroyed when they pass a certain 'y' threshold value,

Follow these **steps**:

1. **Random Object Selection:**

   * Define prefabs for both the cube and capsule to instantiate them.
   * Use the `Random.Range` method to select between cubes and capsules.
2. **Instantiate Objects:**

   * Within your coroutine, based on the random selection, instantiate either a cube or a capsule.
3. **Destroy Object Based on 'Y' Value:**

   * Check the 'y' value for both cubes and capsules.
   * Destroy the object once it surpasses the specified 'y' value threshold.

📔**Remember !!** Make sure to define and assign your cube and capsule prefabs, as well as setting the "y" threshold value to destroy them.

[PreviousCoroutines](/videogames-with-unity/5.-scripting/coroutines)[Next6. Unity in Action. Developing a Game Step by Step: Destroy Stones](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones)

Last updated 1 year ago