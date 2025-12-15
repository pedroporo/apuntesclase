# Coroutines

Source: https://ecm-pmdm-unity.gitbook.io/videogames-with-unity/5.-scripting/coroutines

**Coroutines** in Unity are a powerful and efficient tool for managing complex tasks and sequences of actions without the constant overhead of threads.

They work by allowing the creation of methods that, instead of running to completion all at once, **can** **pause** **their** **execution** at certain points and resume from where they left off in subsequent frames. This is accomplished using the `yield return` statement within methods that return `IEnumerator`.

**Unity** **handles** these **coroutines**, ensuring they **resume** right **after** the **last** `yield return`, **rather** **than** **starting** from the **beginning**.

Coroutines are **executed** **after** **all** objects in the scene have gone through their **late** **update** phase, allowing them to seamlessly integrate into Unity's lifecycle without the complexity of managing threads.

The main **benefits** of using coroutines include:

* **Control**: They provide finer control over the flow of operations, with the ability to **start**, **pause**, and **stop** them as needed, resulting in **cleaner** **code**.
* **Efficiency**: Particularly useful for tasks that need to happen over time or check conditions periodically, such as checking if a level is completed without needing to do so every frame, thus reducing the computation needed per frame.

439KB

[16\_Coroutines.pdf](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2Fo8OFb5N0q5IKYKOsdODJ%2F16_Coroutines.pdf?alt=media&token=9d09cfb0-ea7c-4461-ab20-f9ef1c84a139)

PDF

Download[Open](https://1783396225-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FdRlCVp8VBZ34m99uWkGs%2Fuploads%2Fo8OFb5N0q5IKYKOsdODJ%2F16_Coroutines.pdf?alt=media&token=9d09cfb0-ea7c-4461-ab20-f9ef1c84a139)

## "Volcano" example using a coroutine

Let's **transform** our example of the "Volcano" by using a **coroutine** to instantiate prefabs at the specified **fireRate.**

[PreviousPrefab Instantiation](/videogames-with-unity/5.-scripting/prefab-instantiation)[NextProposed Exercises](/videogames-with-unity/5.-scripting/proposed-exercises)

Last updated 1 year ago