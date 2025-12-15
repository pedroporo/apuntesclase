# Communication Between Scripts

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/5.-scripting/communication-between-scripts

## Accessing Object Components

Modifying GameObject component properties through scripting can significantly enhance gameplay and interactivity in Unity projects.

For example, to get access to AudioSource component will use the method: `gameobject.GetComponent``<AudioSource>()`

574KB

[14\_Accesing\_to\_components.pdf](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FXmcB6WiWCYH39lwjjk5d%2F14_Accesing_to_components.pdf?alt=media&token=78059b1c-c596-47eb-b98d-6fd109650ede)

PDF

Download[Open](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FXmcB6WiWCYH39lwjjk5d%2F14_Accesing_to_components.pdf?alt=media&token=78059b1c-c596-47eb-b98d-6fd109650ede)

## Communication Between Objects

In Unity, you can use the `Find` method to locate GameObjects in your scene. There are a few variations of this method:

* `GameObject.Find(string name)`: This method finds a GameObject by its name. The `name` parameter is the exact name of the GameObject in the **hierarchy** **view.**
* `Transform.Find(string name)`: This method searches for a child GameObject **under** a **parent** GameObject’s Transform. The `name` parameter is the exact name of the child GameObject.
* `GameObject.FindWithTag(string tag)`: This method finds a GameObject with a **specific** **tag**.
* `Object.FindObjectOfType(Type type)`: This method finds a GameObject of a **specific** **type**.

Remember, these methods **return** **only** **the** **first** active GameObject they find. If there are multiple GameObjects with the same name or tag, you might not get the one you expect.

We can also **communicate** **with** **objects** using the methods **SendMessage** and **BroadcastMessage**.

460KB

[15\_Communication\_between\_objects.pdf](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2Fh2BlFWrpQM711hlwVh0A%2F15_Communication_between_objects.pdf?alt=media&token=723b6efe-2130-4866-9f9a-636632fe39f9)

PDF

Download[Open](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2Fh2BlFWrpQM711hlwVh0A%2F15_Communication_between_objects.pdf?alt=media&token=723b6efe-2130-4866-9f9a-636632fe39f9)

## Example of Communication: Following the Sphere with the Camera in Physics Mode

In our example, to make the camera follow the sphere, we found a simple solution: making the **camera** a **child** of the **sphere**. This method was effective when using kinematics, but now that the sphere is moving using physics, we encounter an issue: The sphere rolls across the surface, and the **camera**, being a child of the sphere, **rotates** along with it. This is not desirable for our purposes. We need to implement a different strategy to maintain a stable camera view while still following the sphere's movement.

In the following video, the **camera's** parent-child link to the sphere is **replaced** by a C# script named `Follow`. This script keeps the camera a fixed distance from the sphere but updates its position to track the sphere's movements, now physics-based, without copying sphere rotation. This ensures the camera follows the sphere smoothly in a physics-driven setting, **without** **any** **rotation** issues.

##

[PreviousCollisions and Triggers](/videogames-with-unity/5.-scripting/collisions-and-triggers)[NextPrefab Instantiation](/videogames-with-unity/5.-scripting/prefab-instantiation)

Last updated 1 year ago