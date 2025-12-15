# Collisions and Triggers

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/5.-scripting/collisions-and-triggers

## Collision Detection

**Collisions** are crucial in many games and interactive applications, and **specific** **actions** may need to be carried out when these collisions occur.

GameObjects with a Rigidbody component are under the control of the physics engine, allowing them to react appropriately to collisions with other objects (In 2D games with the Rigidbody2D). **Colliders** **are necessary components** for these GameObjects to interact physically with other objects.

Unity provides methods like `OnCollisionEnter()`, `OnCollisionStay()`, and `OnCollisionExit()` to **handle** different stages of collision events (‘2D’ suffix is added to methods for 2D games)

**Tags** can be created and assigned to objects to group them into categories (like enemies, walls, etc.), which can be useful in determining how to react to a collision.

Colliders usually have a simpler geometry than the object itself to simplify calculations and avoid performance issues with complex geometries. However, complex colliders can be created by adding children with colliders to the GameObject.

**Remember**: To have an object under physics forces, it must have a Rigidbody. Detecting collisions requires a collider. A collider is also needed to detect the object using methods like raycast or `OnMouseDown`.

436KB

[12\_Collision\_detection.pdf](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FS5kyTnCexZMj16TeeF5e%2F12_Collision_detection.pdf?alt=media&token=fa74f26e-00ab-4762-90f9-07ae5fa1e0db)

PDF

Download[Open](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FS5kyTnCexZMj16TeeF5e%2F12_Collision_detection.pdf?alt=media&token=fa74f26e-00ab-4762-90f9-07ae5fa1e0db)

## Detecting collisions in practice

Let's **enhance** the "**Sphere** **game"** with **collision** **detection** and **carry** **out** an **action** in **response.**

* The video demonstrates how to use **tags** for categorizing **GameObjects** and managing collision responses: creating a new **tag** named **"enemy"** and assigning this tag to the cube prefab.
* Furthemore, it explains how to set up collision detection so that when a **sphere** **collides** **with** a GameObject **cube** **tagged** as "**enemy**," the **cube** is **destroyed**.

## Triggers

**Triggers**, marked as `isTrigger` on a **collider**, allow GameObjects to enter **without** causing a **physics** **reaction**. The methods `OnTriggerEnter()`, `OnTriggerStay()`, and `OnTriggerExit()` handle the different stages of a trigger event.

They are useful for executing specific actions upon collision, such as:

* Spawning enemies,
* Opening doors,
* Changing music,
* Collecting game elements like *coins* or *stars*, etc.

At least **one** of the **gameobjects** **involved** in the **collision** must have a **Rigidbody** component **attached** for Unity to detect a trigger.

433KB

[13\_Triggers.pdf](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FDfBTR34LimnV8cFEr5pW%2F13_Triggers.pdf?alt=media&token=9214f503-6275-4799-832e-ecc13a811c2e)

PDF

Download[Open](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FDfBTR34LimnV8cFEr5pW%2F13_Triggers.pdf?alt=media&token=9214f503-6275-4799-832e-ecc13a811c2e)

## Detecting Triggers in practice

Let's practice using triggers in the "Sphere Game" to detect when a sphere goes through an area:

* Creating an **scaled** **cube** with only a Transform and a collider component marked as trigger.
* Modifying script Move.cs to add `OnTriggerEnter` event.

[PreviousUnity Scripts. Basic methods (Event functions)](/videogames-with-unity/5.-scripting/unity-scripts.-basic-methods-event-functions)[NextCommunication Between Scripts](/videogames-with-unity/5.-scripting/communication-between-scripts)

Last updated 1 year ago