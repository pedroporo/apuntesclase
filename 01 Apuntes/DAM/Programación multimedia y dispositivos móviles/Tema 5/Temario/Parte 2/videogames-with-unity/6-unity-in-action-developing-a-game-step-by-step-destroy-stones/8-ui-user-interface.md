# 8. UI (User Interface)

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/8.-ui-user-interface

In the next video, let's learn how to use Unity User Interface tools to display the counts stored in the GameManager class.

Essentially, we will display a couple of **texts** that will **overlay** the game **screen**. This feature is known as a **HUD (Head-Up Display)** because it is **always** **visible** regardless of where the camera is looking at.

* The **UI** **elements** will be **contained** **within** a **Canvas**, that we will add to the scene. Canvas properties are changed to **overlay** **screen** (HUD) and to **scale** **with** **Screen** **Size** (automatically adapts to different screen sizes).
* UI **elements** must be **anchored** to ensure **consistent** **display** on any screen size.

A **new** **script** **InterfaceStone.cs** is created to update UI Text with information from the GameManager. This script is **attached** to the **Canvas**.

InterfaceStone.cs (using Text Mesh Pro):

**Attention**: **Text** is **Legacy**: Use **TextMesh Pro** instead.

To use TextMesh Pro, follow these steps to ensure flexible and scalable rendering of UI text elements:

1. **Add TextMesh Pro Component**: Add a TextMesh Pro text object to your **scene** by right-clicking in the hierarchy panel and selecting `UI ->TextMeshPro - Text` (TextMesh Pro package is imported into your Unity project)
2. **Accessing TextMesh Pro in Script:**

   * First, include the TextMesh Pro namespace at the top of your script:

   `using` `TMPro;`

   * Then, create a reference to the TextMesh Pro component:

   `public``TMP_Text``textMeshPro;`
3. **Assigning the Text Object**: In the Unity Editor, **drag** your **TextMesh** **Pro** **UI** object to the new **field** in your script component to assign it.
4. You can **change** the textMeshPro **properties** from your script: `text`, `fontSize`, `fontStyle`, etc.

[Previous7. GameManager](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/7.-gamemanager)[Next9. Adding Scenes](/videogames-with-unity/6.-unity-in-action.-developing-a-game-step-by-step-destroy-stones/9.-adding-scenes)

Last updated 1 year ago