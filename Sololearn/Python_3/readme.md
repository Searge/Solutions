[Python 3 Tutorial](https://www.sololearn.com/Play/Python)

# Functional Programming

**functional programming** is a style of programming that (as the name suggests) is based around functions. 
A key part of functional programming is **higher-order functions**. We have seen this idea briefly in the previous lesson on functions as objects. Higher-order functions take other functions as arguments, or return them as results.

[**Example**](functions.py)

# Pure Functions

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

# Lambdas

Creating a function normally (using def) assigns it to a variable automatically. 
This is different from the creation of other objects - such as strings and integers - which can be created on the fly, without assigning them to a variable. 
The same is possible with functions, provided that they are created using lambda syntax. Functions created this way are known as anonymous.
This approach is most commonly used when passing a simple function as an argument to another function. The syntax is shown in the next example and consists of the lambda keyword followed by a list of arguments, a colon, and the expression to evaluate and return.

> Lambda functions get their name from lambda calculus, which is a model of computation invented by Alonzo Church.

Lambda functions aren't as powerful as named functions. 
They can only do things that require a single expression - usually equivalent to a single line of code.

[**Example**](lambdas.py)

# <mark>map</mark>

The built-in functions map and filter are very useful higher-order functions that operate on lists (or similar objects called iterables). 
The function map takes a function and an iterable as arguments, and returns a new iterable with the function applied to each argument. 

[**Example**](map_n_filter.py)

# <mark>**filter**</mark>

The function filter filters an iterable by removing items that don't match a predicate (a function that returns a Boolean). 

# Generators

Generators are a type of iterable, like lists or tuples. 
Unlike lists, they don't allow indexing with arbitrary indices, but they can still be iterated through with for loops. 
They can be created using functions and the `yield` statement.

[**Example**](Generators.py)

# Decorators

**Decorators** provide a way to modify functions using other functions. 
This is ideal when you need to extend the functionality of functions that you don't want to modify.


We defined a function named `decor` that has a single parameter `func`. Inside `decor`, we defined a nested function named `wrap`. The `wrap` function will print a string, then call `func()`, and print another string. The `decor` function returns the `wrap` function as its result.
We could say that the *variable* **decorated** is a decorated version of **print_text** - it's **print_text** plus something. 
In fact, if we wrote a useful *decorator* we might want to replace **print_text** with the decorated version altogether so we always got our "plus something" version of **print_text**. 
This is done by re-assigning the *variable* that contains our *function*:

[**Example**](Decorators.py)

# Recursion

Recursion is a very important concept in functional programming. 
The fundamental part of recursion is self-reference - functions calling themselves. It is used to solve problems that can be broken up into easier sub-problems of the same type.

A classic example of a function that is implemented recursively is the **factorial** function, which finds the product of all positive integers below a specified number. 
For example, 5! (5 factorial) is 5 * 4 * 3 * 2 * 1 (120). To implement this recursively, notice that 5! = 5 * 4!, 4! = 4 * 3!, 3! = 3 * 2!, and so on. Generally, n! = n * (n-1)!. 
Furthermore, 1! = 1. This is known as the **base case**, as it can be calculated without performing any more factorials. 
Below is a recursive implementation of the factorial function.

[**Example**](Recursion.py)