# Scene view - Additional elements

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/1.-introduction-to-unity/exploring-unity-editor/scene-view-additional-elements

In the next video, we're going to cover several key concepts and tools, including:

1. **Global and Local Coordinate Systems**: When moving or transforming an object, you can use either the global or local coordinate system. The **global** **coordinate** system is **aligned** **with** the **scene**, while the **local** **coordinate** system **belongs** to the **object** itself. You can switch between these systems depending on your needs.
2. **Center and Pivot**: When rotating an object, you can choose to **rotate** **around** the **geometrical** **center** of the object **or** **around** the **pivot**. The pivot is a point that is usually designated by the designer of the object. It can be useful to rotate or scale around the pivot instead of the center.
3. **Snapping tools:**

   1. **Grid Snapping**: That forces object to **align** **to** **grid**. Use Handle in the Scene Toolbar to activate it.
   2. **Vertex Snapping:** Useful to **align** **vertices** of different objects precisely: Press and Hold **V key** and with left mouse button move the desired vertex to vertex of the desired object.

Put it all in **practice**:

1. **Creating a Wall**: The video demonstrates how to create a wall by adding cubes (representing bricks) to the scene (**to** **duplicate**: **Ctrl+D/Cmd+D**). You can move the cubes using the translation tool and place them next to each other. To **avoid gaps** or **overlaps** between the bricks, use **Grid Snapping** and **Vertex Snapping.**
2. **Transform Component**: Change numerically (manually) the **position**, **rotation**, and **scale** of an object in the transform component, in the inspector. This can be more accurate than making changes visually, by eye.
![](https://www.youtube.com/watch?v=uNyr4a5-2g8)

> [!warning]
> **ATENTION: Snapping is no longer in the Edit menu.**
> 
> Grid Snapping is now available as a handle the **SceneView Toolbar.** Snapping applies when *Tool Handle Rotation* is set to **Global:**
> 
> ![[toolvarSnap-old.avif]]
> 
> *-> Efect when translating object: it will move exactly 1 meter in each axes.*
> 
> **Increment Snapping:** Press **Ctrl/Cmd** while moving object for more precise snaps.
> 
> ![[toolvarSnap-new.avif]]

Previous: [[scene-view-basic-elements]]

Next: [[scene-view-summary]]


