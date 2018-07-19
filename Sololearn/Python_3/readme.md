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

[**Example:**](lambdas.py)