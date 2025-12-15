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

**ATENTION: Snapping is no longer in the Edit menu.**

Grid Snapping is now available as a handle the **SceneView Toolbar.** Snapping applies when *Tool Handle Rotation* is set to **Global:**

![](https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/~gitbook/image?url=https%3A%2F%2F1783396225-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FdRlCVp8VBZ34m99uWkGs%252Fuploads%252FBRuBIuq4idjJADxnddeS%252Fimage.png%3Falt%3Dmedia%26token%3Db771fb87-9ecf-4e82-9ab1-a22c20ef88bf&width=300&dpr=4&quality=100&sign=b2f31d21&sv=2)

*-> Efect when translating object: it will move exactly 1 meter in each axes.*

**Increment Snapping:** Press **Ctrl/Cmd** while moving object for more precise snaps.

![](https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/~gitbook/image?url=https%3A%2F%2F1783396225-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FdRlCVp8VBZ34m99uWkGs%252Fuploads%252FV5NNcqxgaiebKTJKuHZ4%252Fimage.png%3Falt%3Dmedia%26token%3Da47e41ed-d99b-421b-bea2-338396c989c0&width=300&dpr=4&quality=100&sign=a38f870f&sv=2)

[PreviousScene view - Basic elements](/videogames-with-unity/1.-introduction-to-unity/exploring-unity-editor/scene-view-basic-elements)[NextScene view - Summary](/videogames-with-unity/1.-introduction-to-unity/exploring-unity-editor/scene-view-summary)

Last updated 1 year ago