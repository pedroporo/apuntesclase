# First Example with Physics

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/3.-the-unity-physics-engine/first-example-with-physics

In the next videos will learn:

* How to **transform** the **first** **example** **from** **kinematic** **to** **physics** by attaching a **Rigidbody** component to the sphere.
* How to **make** the **sphere** **jump.**
* How to **create** **Prefabs** from our GameObjects that we can use as a template to create instances
* How to **play** a **sound** when the **sphere** **jumps**.

## From kinematics to physics

* Introduces **FixedUpdate** method: called by Unity Physics engine at regular pace (independent of frame/rate).
* Explains how to **get** **Rigidbody** **component** in the **Start** method (Start is called only once for this script instance, just before calling first frame Update)
* Add code to FixedUpdate to **move** **Gameobject in a physics way**: by calling rigidbody methods that **apply** **forces** to GameObject. The result is that **sphere** will **rotate** instead of translate, when a **constant** **force** is applied.

## Jumping

* Let's **make** the **sphere** **jump** when user presses-down "Jump" key (SPACE BAR key).
* This is done in the **Update** method to detect **immediately** when user presses "Jump" keyand then apply an **impulse** **force** that causes sphere to jump on "y" Axes.

## Prefabs

433KB

[05\_\_Prefabs.pdf](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FQY1uRwooFQdYKt1TM7ma%2F05__Prefabs.pdf?alt=media&token=ee12d6f2-6cd0-463b-af69-92f21e0bc778)

PDF

Download[Open](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FQY1uRwooFQdYKt1TM7ma%2F05__Prefabs.pdf?alt=media&token=ee12d6f2-6cd0-463b-af69-92f21e0bc778)

## Obstacles and prefabs

This video demostrates:

* How to **create** **a** **prefab** from a Cube GameObject.
* How to **add components** or **change** **properties** of the prefab that are applied to all instances of the prefab.
* Make Cube prefab under control of physics engine by adding a Rigidbody component. Observe the effect when sphere collides with cubes.

## Adding sound

The next video explains the **components** related to sound and how to **play** **sound** when sphere "Jumps":

* **AudioListener**: component able to **listen** **to** **sounds** and music, by default, it is atttached to main camera.
* **AudioSource**: component able to **play** **sounds** and music.

You can download the a Jump sound mp3 from this link:

13KB

[Sound\_boing\_jump.mp3](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FUuaEADNZixbeWjac3e4g%2FCartoon%20Hop-SoundBible.com-553158131.mp3?alt=media&token=1837442a-2db9-4d23-8a03-0605639bf21d)

Download[Open](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2FUuaEADNZixbeWjac3e4g%2FCartoon%20Hop-SoundBible.com-553158131.mp3?alt=media&token=1837442a-2db9-4d23-8a03-0605639bf21d)

<https://soundbible.com/85-Cartoon-Hop.html> *License: Personal Use Only*

[PreviousIntroduction to physics](/videogames-with-unity/3.-the-unity-physics-engine/introduction-to-physics)[NextProposed Exercises](/videogames-with-unity/3.-the-unity-physics-engine/proposed-exercises)

Last updated 1 year ago