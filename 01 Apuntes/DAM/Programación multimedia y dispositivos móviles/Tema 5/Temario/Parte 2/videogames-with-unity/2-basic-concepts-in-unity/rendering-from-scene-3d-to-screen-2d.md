# Rendering: From Scene (3D) to Screen (2D)

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/2.-basic-concepts-in-unity/rendering-from-scene-3d-to-screen-2d

Unity uses a process called "**rendering**" to **transform** the **3D** **scene** into a **2D** **image** that can be displayed on the screen. This process involves several **steps**:

1. **Culling**: Unity determines **which** **objects** in the scene **are** **visible** from the **camera** **perspective**. Objects that are outside the camera's field of view, or that are hidden by other objects, are discarded and not processed in the following steps.
2. **Transformation and Projection**: The visible objects are transformed from the **3D world space** **to** the **camera space** using the **camera view matrix**. Then, they are **projected** **into** the **screen** 2D space using the **camera's projection matrix**.
3. **Rasterization**: The projected objects are converted into **pixels**. In this step, **shaders** are **applied** to calculate the color of each pixel.
4. **Post-processing**: Finally, post-processing effects are applied to the rasterized image to **enhance** its **appearance**. These can include effects like motion blur, color correction, depth of field blur, etc.

This is how Unity transforms the 3D scene into a 2D image that can be displayed on the screen. It's a complex process, but Unity handles most of the details for you, allowing you to focus on creating your game or application.

**Camera View Matrix:** It is a transformation matrix that [changes the perspective of viewing objects from the global viewpoint of the game world to the specific perspective of the camera.](https://docs.unity3d.com/ScriptReference/Camera-worldToCameraMatrix.html)

When an object is rendered on the screen, its **position** in the **world** **space** is **multiplied** by the camera view **matrix** to **obtain** its **position** in the **camera** **space**.

**Camera projection Matrix:** It is a transformation matrix that that takes points in the 3D space as seen from the camera’s perspective and transforms them into a form that can be further processed for rendering on a 2D screen. [This matrix is responsible for creating the perspective distortion in the 3D scene](https://docs.unity3d.com/ScriptReference/Matrix4x4.Perspective.html).

The perspective matrix is **defined** **by** the camera’s field of view (**FOV**), **aspect** **ratio**, and the **distances** to the **near** and **far** **clipping** **planes** (closest and furthest distance to render objects).

[PreviousFirst example - Creating the Script](/videogames-with-unity/2.-basic-concepts-in-unity/first-example-creating-the-script)[NextProposed Exercise](/videogames-with-unity/2.-basic-concepts-in-unity/proposed-exercise)

Last updated 1 year ago