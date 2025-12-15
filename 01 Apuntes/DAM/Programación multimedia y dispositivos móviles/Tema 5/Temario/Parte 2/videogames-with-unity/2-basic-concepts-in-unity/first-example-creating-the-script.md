# First example - Creating the Script

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/2.-basic-concepts-in-unity/first-example-creating-the-script

In the following series of videos, you will learn how to model the behaviour of the **sphere** by adding a **C# Script** component.

Here are the **essential** **points** covered:

* How to **create** a new **C#** **script.**
* **Open** the script using C# external editor, like Visual Studio Code (set it up in Unity settings)
* **Explain Update method:** Update is a pre-defined method that Unity calls once per frame, ideal to non dependent physics actions: kinematic move, update game state, check user input, etc.
* **Update** **sphere** **position on user input:** Check in the **Update** method, using **Input** class, if the user presses **cursor** **keys** (up, down, left,right) and then **update** **sphere's** **position**.
* Explain the **difference** between **kinematic movement** (without using forces) and **physics** **movement** (using forces, simulated making use of physics engine).
* **Define** **a** ***speed*** **variable:**  To **move** **sphere** at certain **speed** in **meters**/**second**, independently of the device frame/rate, thanks to **Time.deltaTime** value (time in seconds to complete last frame).
* Make the **camera** **follow** the **sphere:** Making it **child** of sphere.
* **Add** the new **script** **as** a **component** to the **sphere**.
![](https://youtu.be/M4wrZ-83TlM)
![](https://youtu.be/7OvPq77bGm4)
![](https://youtu.be/04S4smELLBk)

## Time.deltaTime

[PreviousFirst example - The structure of a project](/videogames-with-unity/2.-basic-concepts-in-unity/first-example-the-structure-of-a-project)[NextRendering: From Scene (3D) to Screen (2D)](/videogames-with-unity/2.-basic-concepts-in-unity/rendering-from-scene-3d-to-screen-2d)

Last updated 1 year ago