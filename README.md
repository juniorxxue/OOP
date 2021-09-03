# What is Object-Oriented Programming?

## Benjamin C. Pierce's Answer

*Types and Programming Languages, p226, p227*

> we can identify a few fundamental features ...
> 1. Multiple representations ... 
> 2. Encapsulation ...
> 3. Subtyping ... 
> 4. Inheritance ...
> 5. Open recursion ... 

## Answer in Real World OCaml

> 1. Abstraction
> 
> The details of the implementation are hidden in the object, and the external interface is just the set of publicly accessible methods.
> 
> 2. Dynamic lookup
> 
> When a message is sent to an object, the method to be executed is determined by the implementation of the object, not by some static property of the program. In other words, different objects may react to the same message in different ways.
> 
> 3. Subtyping
> 
> If an object a has all the functionality of an object b, then we may use a in any context where b is expected.
> 
> 4. Inheritance
> 
> The definition of one kind of object can be reused to produce a new kind of object. This new definition can override some behavior, but also share code with its parent.
> 
> 5. Open recursion
> 
> An object’s methods can invoke another method in the same object using a special variable (often called self or this). When objects are created from classes, these calls use dynamic lookup, allowing a method defined in one class to invoke methods defined in another class that inherits from the first.
