# 1. Folders and prefabs

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/1.-folders-and-prefabs

Let's **create** a **new** **game** from **scratch**!

In the **first** **video**, we are going to **add** and **create** **assets** for the game in the following **steps**:

1. Change the default scene name by: "**StonesGame**"
2. **Create** **folders** for Assets: Models, Materials, Scripts and Prefabs.
3. Import the file **stone.fbx** to Models folder (drag&drop) and, as this model is very small, change its **Scale Factor** property to **300**.
4. Open the structure of **stone.fbx** model (using its little arrow), locate the **shape** and drag and drop it **to** the **scene**.
5. In the scene, select the gameobject created for the stone and add to it a **Rigidbody** and a **Sphere** **Collider**.
6. **Create** **3** **original prefabs** from the gameobject stone (drag and drop to Prefabs folder): **Stone1**, **Stone2**, **Stone3**.
7. Within Materials folder, **create** 3 **materials** of different colors: **m\_stone1**, **m\_stone2**, **m\_stone3**
8. **Assign** each **material** **to** the appropiate **Stone** **prefab**.
9. **Remove** **gameobject** **stone** **from** **scene** as we are going to create random stones from script.

[Previous6. Unity in Action. Developing a Game Step by Step: Destroy Stones](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones)[Next2. Main loop](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/2.-main-loop)

Last updated 1 year ago