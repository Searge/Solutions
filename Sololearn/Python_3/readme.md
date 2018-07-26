[Python 3 Tutorial](https://www.sololearn.com/Play/Python)

# Functional Programming

**functional programming** is a style of programming that (as the name suggests) is based around functions. 
A key part of functional programming is **higher-order functions**. We have seen this idea briefly in the previous lesson on functions as objects. Higher-order functions take other functions as arguments, or return them as results.

[**Example**](functions.py)

## Pure Functions

Functional programming seeks to use **pure functions**. Pure functions have no side effects, and return a value that depends **only** on their arguments.
This is how functions in math work: for example, The cos(x) will, for the same value of x, always return the same result.
Below are examples of pure and impure functions.

Using pure functions has both advantages and disadvantages. 
Pure functions are:
- easier to reason about and test.
- more efficient. Once the function has been evaluated for an input, the result can be stored and referred to the next time the function of that input is needed, reducing the number of times the function is called. This is called **memorization**.
- easier to run in parallel.

> The main disadvantage of using only pure functions is that they majorly complicate the otherwise simple task of I/O, since this appears to inherently require side effects. 
> They can also be more difficult to write in some situations.

## Lambdas

Creating a function normally (using def) assigns it to a variable automatically. 
This is different from the creation of other objects - such as strings and integers - which can be created on the fly, without assigning them to a variable. 
The same is possible with functions, provided that they are created using lambda syntax. Functions created this way are known as anonymous.
This approach is most commonly used when passing a simple function as an argument to another function. The syntax is shown in the next example and consists of the lambda keyword followed by a list of arguments, a colon, and the expression to evaluate and return.

> Lambda functions get their name from lambda calculus, which is a model of computation invented by Alonzo Church.

Lambda functions aren't as powerful as named functions. 
They can only do things that require a single expression - usually equivalent to a single line of code.

[**Example**](lambdas.py)

## <mark>map</mark>

The built-in functions map and filter are very useful higher-order functions that operate on lists (or similar objects called iterables). 
The function map takes a function and an iterable as arguments, and returns a new iterable with the function applied to each argument. 

[**Example**](map_n_filter.py)

## <mark>**filter**</mark>

The function filter filters an iterable by removing items that don't match a predicate (a function that returns a Boolean). 

## Generators

Generators are a type of iterable, like lists or tuples. 
Unlike lists, they don't allow indexing with arbitrary indices, but they can still be iterated through with for loops. 
They can be created using functions and the `yield` statement.

[**Example**](Generators.py)

## Decorators

**Decorators** provide a way to modify functions using other functions. 
This is ideal when you need to extend the functionality of functions that you don't want to modify.


We defined a function named `decor` that has a single parameter `func`. Inside `decor`, we defined a nested function named `wrap`. The `wrap` function will print a string, then call `func()`, and print another string. The `decor` function returns the `wrap` function as its result.
We could say that the *variable* **decorated** is a decorated version of **print_text** - it's **print_text** plus something. 
In fact, if we wrote a useful *decorator* we might want to replace **print_text** with the decorated version altogether so we always got our "plus something" version of **print_text**. 
This is done by re-assigning the *variable* that contains our *function*:

[**Example**](Decorators.py)

## Recursion

Recursion is a very important concept in functional programming. 
The fundamental part of recursion is self-reference - functions calling themselves. It is used to solve problems that can be broken up into easier sub-problems of the same type.

A classic example of a function that is implemented recursively is the **factorial** function, which finds the product of all positive integers below a specified number. 
For example, 5! (5 factorial) is 5 * 4 * 3 * 2 * 1 (120). To implement this recursively, notice that 5! = 5 * 4!, 4! = 4 * 3!, 3! = 3 * 2!, and so on. Generally, n! = n * (n-1)!. 
Furthermore, 1! = 1. This is known as the **base case**, as it can be calculated without performing any more factorials. 
Below is a recursive implementation of the factorial function.

[**Example**](Recursion.py)

## Sets

**Sets** are data structures, similar to lists or dictionaries. They are created using curly braces, or the **set** function. They share some functionality with lists, such as the use of in to check whether they contain a particular item.

Sets differ from lists in several ways, but share several list operations such as len. 
They are unordered, which means that they can't be indexed. 
They **cannot** contain duplicate elements. 
Due to the way they're stored, it's **faster** to check whether an item is part of a set, rather than part of a list.
Instead of using **append** to add to a set, use **add**. 
The method remove **removes** a specific element from a set; **pop** removes an arbitrary element.

Sets can be combined using mathematical operations.
* The **union** operator `|` combines two sets to form a new one containing items in either. 
* The **intersection** operator `&` gets items only in both. 
* The **difference** operator `-` gets items in the first set but not in the second. 
* The **symmetric difference** operator `^` gets items in either set, but not both.

[**Example**](Sets.py)

### Data Structures

As we have seen in the previous lessons, Python supports the following data structures: **lists, dictionaries, tuples, sets**.

*When to use* a **dictionary**:
- When you need a logical association between a `key:value` pair.
- When you need fast lookup for your data, based on a custom key.
- When your data is being constantly modified. Remember, dictionaries are *mutable*.

*When to use* the **other types**:
- Use **lists** if you have a collection of data that does not need random access. Try to choose lists when you need a simple, iterable collection that is modified frequently.
- Use a **set** if you need uniqueness for the elements. 
- Use **tuples** when your data cannot change. 

> Many times, a tuple is used in combination with a dictionary, for example, a tuple might represent a key, because it's immutable.

## <mark>itertools</mark>>

The module `itertools` is a standard library that contains several functions that are useful in functional programming. 
One type of function it produces is infinite iterators. 
* The function `count` counts up infinitely from a value.
* The function `cycle` infinitely iterates through an iterable (for instance a list or string). 
* The function `repeat` repeats an object, either infinitely or a specific number of times.

There are many functions in `itertools` that operate on iterables, in a similar way to map and filter. 
Some examples:
* `takewhile` - takes items from an iterable while a predicate function remains true;
* `chain` - combines several iterables into one long one; 
* `accumulate` - returns a running total of values in an iterable.

There are also several combinatoric functions in `itertool`, such as `product` and `permutation`.
These are used when you want to accomplish a task with all possible combinations of some items.

[**Example**](itertools.py)

## Module 6 Quiz

[Quiz Solutions](Quiz_Solutions.py)

# Object-oriented programming

## Classes

We have previously looked at two paradigms of programming - **imperative** (using statements, loops, and functions as subroutines), and **functional** (using *pure functions*, *higher-order functions*, and *recursion*).

Another very popular paradigm is **object-oriented programming** (OOP).
Objects are created using classes, which are actually the focal point of OOP.
The **class** describes what the object will be, but is separate from the object itself. In other words, a class can be described as an object's blueprint, description, or definition.
You can use the same class as a blueprint for creating multiple different objects. 

Classes are created using the keyword `class` and an indented block, which contains class **methods** (which are functions). 
Below is an example of a simple class and its objects.

## `__init__`

The `__init__` method is the most important method in a class. 
This is called when an instance (object) of the class is created, using the class name as a function.

All methods must have `self` as their first parameter, although it isn't explicitly passed, Python adds the `self` argument to the list for you; you do not need to include it when you call the methods. Within a method definition, `self` refers to the instance calling the method.

Instances of a class have **attributes**, which are pieces of data associated with them.
In this example, **Cat** instances have attributes **color** and **legs**. These can be accessed by putting a **dot**, and the attribute name after an instance. 
In an `__init__` method, **self.attribute** can therefore be used to set the initial value of an instance's attributes.

[**Example**](Classes.py)

## Methods

Classes can have other **methods** defined to add functionality to them. 
Remember, that all methods must have **self** as their first parameter.
These methods are accessed using the same **dot** syntax as attributes.

Trying to access an attribute of an instance that isn't defined causes an `AttributeError`. This also applies when you call an undefined method.

[**Example**](Methods.py)