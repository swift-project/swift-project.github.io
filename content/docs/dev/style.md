---
title: Style and Coding Standard
---

{{% alert title="TODO" color="warning" %}}
Need examples.
{{% /alert %}}

Style Conventions
=================

Whitespace and Minutiae
-----------------------

-   Indent with 4 spaces. Don\'t use tabs.

-   Don\'t indent braces. Indent code inside braces.

-   Put braces on a separate line.

    > -   Exception: closing brace of a lambda, braced-initializer, or
    >     do while block hugs the code on its right side.
    > -   Exception: braces surrounding a braced-initializer or a
    >     single-statement block can go all on a single line.

-   When braces are not on a separate line, put a space between them and
    adjacent tokens.

-   No spaces around parentheses, square brackets, or angle brackets.

-   Put a space after a compound statement keyword (if, for, while,
    etc.) and its opening parenthesis.

-   Always use braces in a compound statement, even if they only enclose
    zero or one statement. (This helps avoid terrible mistakes.)

-   Put a space between a binary operator and its operand. No space
    between a unary operator and its operand.

-   When declaring a pointer or reference, put a space before the \* or
    &.

-   Write `const char` not `char const`

Naming
------

-   Use camel case.
-   Namespaces, classes, and enums start with a capital letter.
    Functions and variables starts with a lower-case letter.
-   Classes begin with a `C`, except traits classes which begin with a
    `T`.
-   Data members begin with `m_`. Static data members begin with `s_`.
    Const static data members begin with `c_`. Avoid underscores
    elsewhere.
-   Use American English spelling.

Documentation
-------------

-   Use `//!` and `/*!` style Doxygen comments.

-   Each header and source file has a `//! \file`.

-   Document classes and non-member functions with `/*!`. Document
    members with `//!`.

-   Document everything that is public or protected.

    > -   Exception: it is not necessary to document a function that
    >     overrides a documented virtual function.

-   Use `\cond`, `\private`, or `\internal` for undocumented
    implementation details at namespace scope.

-   Use `\copydoc` to avoid duplication.

Tooling
-------

-   `astyle` can be used with the following options:

``` {.}
--style=allman --indent=spaces=4 --indent-cases --indent-namespaces --indent-labels
--indent-preprocessor --min-conditional-indent=2 --pad-oper --pad-header --unpad-paren
--keep-one-line-blocks --keep-one-line-statements --convert-tabs --align-pointer=name
```

Coding Standard
===============

Basics
------

-   Headers have include guards that are uppercase transformations of
    the header path with non-alphanumeric characters transformed to
    underscores.
-   Include all needed headers before any substantive line of code.
    Include files in order from most specific to most generic. The first
    header included in a source file must be its corresponding header
    file.
-   Include *swift* headers with `#include ""`. Include other headers
    with `#include <>`. Always use the full path of swift headers.
-   Use forward-declaration to avoid excessive includes.
-   Don\'t `using namespace` in headers.
-   Don\'t optimize prematurely. Don\'t pessimize prematurely.
-   Utilize Qt and the standard library liberally. Prefer Qt containers.
-   Use the Qt5 pointer-to-member syntax for connecting signals to
    slots.
-   Respect `const` correctness.
-   Avoid top-level const on by-value parameter types and return types
    of function declarations.
-   Fix all compiler warnings.
-   Pass small, trivial arguments by value. Pass large or non-trivial
    arguments by `const` reference.
-   Don\'t allow uninitialized variables.
-   Use RAII effectively.
-   Use C++ features that are supported by all of our compilers
    (currently all of C++11 and 14).
-   Don\'t use `NULL`. Use `nullptr` instead.
-   Use `auto` at your discretion.
-   Use `override` when overriding a virtual function.
-   Don\'t use `dynamic_cast` or C-style casts.
-   Avoid global variables. Static member variables are global
    variables.

Class Design
------------

-   Avoid excessive coupling. Follow SOLID principles. Favor simplicity.
-   Follow the rule of three/five/one/zero.
-   A constructor should be `explicit` if it does anything more than
    just initialise members from arguments.
-   If a class has a virtual function, its destructor must be virtual or
    protected.
-   Avoid long-distance `friends`.
-   Self-assignment must be safe.
-   `mutable` imposes a responsibility to ensure thread-safety.
-   Avoid virtual functions in class templates. They cause long compile
    times.
-   If they are implemented, move and swap must be `noexcept` if
    possible.

Error Handling
--------------

-   Report errors and warnings to the user with `CLogMessage` and
    `CStatusMessage`.
-   Be exception-agnostic. Avoid throwing exceptions in general, except
    for particular use cases where they are well suited.
-   Validate data coming from outside the executable.
-   Use `Q_ASSERT` to document and enforce unrecoverable logical
    invariants.
-   Use `BLACK_VERIFY` to document and enforce recoverable logical
    invariants.

Strings
-------

{{% alert title="TODO" color="warning" %}}
Missing sections
{{% /alert %}}