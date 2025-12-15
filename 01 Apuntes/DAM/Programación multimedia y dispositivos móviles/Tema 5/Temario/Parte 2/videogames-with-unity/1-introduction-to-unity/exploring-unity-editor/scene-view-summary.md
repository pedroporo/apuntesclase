# Scene view - Summary

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/1.-introduction-to-unity/exploring-unity-editor/scene-view-summary

## Object manipulation tools (keys: q,w,r,t)

* The first one is the ‘Hand tool’
* The other 3 tools allow object manipulation: **move** (key ‘**w**’), **rotate** (‘**e**’) and **scale** (‘**r**’)
* Select the object and press the corresponding button/key
* The tool gizmo will allow us to control the object position, scale or rotation in any axis or in a particular axis
* All these tools will change the Transform component of the GameObject, where position, rotation and scale are stored

**Proposed exercise:**

* Create a **GameObject** (sphere, cube ...) and modify its position, scale, rotation, getting familiar with their possibilities and observing in the ‘**Inspector**’ view the values of the ‘**Transform**’ component.
* **Experiment** the effect of pressing the Space Bar + Shift, and selecting an object and pressing ‘**F**’ key (or a double-click over the object in the Hierarchy view).

## Hand tool ('q' key)

How we work with the scene view depends a bit on the operating system we use and even which mouse we have (2 or 3 buttons)

The ‘hand tool’ will change depending on different possibilities: drag (hand), orbital (eye), magnifying glass (zoom)

* **Ctrl** (Windows) / **Cmd** (Mac) -> **zoom** **mode**
* **Alt** -> **orbital** **mode**
* **Mouse** **wheel** can also be used for zooming ( or **Alt** + **mouse** **right** button)
* **Cursor** **keys** -> '**walking**' mode
* **Mouse** **right** **button** + **WASD** + **QE** -> '**fly** **through**' mode

-> Most of the previous keys are still active when 'hand tool' is not selected

**Exercise**: Create several objects, manipulate them and experiment with all the possibilities of the 'hand tool'.

## Position control tools

* **Pivot / Center** allow to use a reference point the pivot of the object (defined by the designer) or the center of the object. They are also interesting when selecting several objects. ‘Pivot’ will be the pivot of one of them, 'Center' will be the center of all the selected objects.
* **Local / Global** will be especially interesting when rotating elements. 'Local' will make rotations to be regarding the local coordinate system, and 'Global' always regarding the global coordinate system of the scene..
* **Multiple** **selection** of objects by pressing **Shift**

**Proposed exercise:** Create several GameObject, select them and experiment the differences between Pivot / Center. Apply a rotation and then experiment new rotations with Local / Global.

## Snapping

**Grid Snapping**

With this option we can use specific magnitudes or values when translating, rotating and scaling.

We can change the snap properties or to force a selected object to match the increments of the snap.

**Vertex Snapping**

With ‘translate’ and pressing the ‘V’ key we can select a vertex and make it match to another vertex of another object. This option is very useful when creating levels whenever we want to match different objects or sections (with no gaps or overlaps).

In general, and even more when creating levels, the Snapping and Vertex Snapping tools are very useful.

[PreviousScene view - Additional elements](/videogames-with-unity/1.-introduction-to-unity/exploring-unity-editor/scene-view-additional-elements)[NextScene view - Toolbar Options and Gizmos](/videogames-with-unity/1.-introduction-to-unity/exploring-unity-editor/scene-view-toolbar-options-and-gizmos)

Last updated 1 year ago