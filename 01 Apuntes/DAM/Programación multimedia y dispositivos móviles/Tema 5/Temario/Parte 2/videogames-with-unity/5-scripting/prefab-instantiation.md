# Prefab Instantiation

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/5.-scripting/prefab-instantiation

So far, in Unity, **prefabs** are **templates** of **game** **objects** that you can **create** and **destroy** **dynamically** in your game scene. This is particularly useful when you need to create objects like bullets in a shooting game.

Let's see **how** **to** **use** the **prefabs** from your **scripts.**

## "Volcano" example: Creating game objects

In the following video, you'll add more functionality to our game **creating** **prefabs** from script:

1. **Create a Prefab**: Start by creating a prefab, which in this case is a cube.
2. **Create an Empty Game Object**: This will serve as a ‘volcano’ that will ‘erupt’ cubes.
3. **Create a Script**: Attach a script to the ‘volcano’ game object. This script will **instantiate** a new cube **every** **half** **second** and launch it with an initial vertical force, simulating an eruption.
4. **Instantiate the Prefab**: In the script, create a GameObject variable called ‘Stone’ and assign the cube prefab to it. This allows you to instantiate new cubes in the game scene.
5. **Set the Fire Rate**: Create a float variable called ‘fireRate’ to control how often a new cube is instantiated and launched. In this case, a new cube is launched every half second.
6. **Track the Next Fire Time**: **Create** another variable called ‘nextFire’ to track when the next cube should be launched.
7. **Destroy the Prefab Instance:** Once the prefab instance Y position surpasses a threshold, use the Destroy method to remove the prefab instance from the game.

This process is done using the `Update()` function and the `Time.time` property in Unity.

In the next section, you’ll learn how to simplify this process using **coroutines**.

[PreviousCommunication Between Scripts](/videogames-with-unity/5.-scripting/communication-between-scripts)[NextCoroutines](/videogames-with-unity/5.-scripting/coroutines)

Last updated 1 year ago