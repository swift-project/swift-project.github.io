---
title: Meta classes
---

{{% alert title="TODO" color="warning" %}}
This document is outdated and needs to be updated to reflect recent evolution of the design.
{{% /alert %}}

# Abstract


We use a system based around `std::tuple` to attach declarative metadata
to the data members of value classes. The intention is to minimize the
number of places where the data members must be listed. Without this
system, each class would need separate lists of its data members for
`operator<`, `operator==`, stringification, streaming to DBus, streaming
to JSON, etc. The tuple system maintains one list of members for each
class, with optional metadata, and the methods can refer back to this
one list.


# Usage


{{% alert title="TODO" color="warning" %}}
Link to Doxygen
{{% /alert %}}

In order for a class or class template to use the tuple system, it must
include the `BLACK_ENABLE_TUPLE_CONVERSION` macro somewhere in its
`private:` section. The macro expects one argument: the name of the
class or class template.

The list of data members is placed in the same header file, outside of
any namespace, using the `BLACK_DECLARE_TUPLE_CONVERSION` macro. The
macro expects two arguments: first, the fully qualified name of the
class or class template; second, a parenthesized, comma-separated list
of expressions, each one identifying a different data member. The
expected syntax of these expressions is described below, under
\"Attribute Expressions\".

To refer back to this list in a function implementation, call
`TupleConverter<T>::toMetaTuple(*this)`, where `T` is the name of the
class or class template. This returns a `std::tuple` of reference
wrappers of the data members of `*this`, which can be operated on by
various free functions; standard C++ already provides overloaded
comparison operators for `std::tuple` which perform lexicographical
comparisons of the elements, and `blackmisc/tuple.h` defines several
more, for streaming `std::tuple` element-by-element to DBus, JSON, etc.

Only member functions of `T` may call `TupleConverter<T>::toMetaTuple`,
otherwise this would break encapsulation.

# Attribute Expressions

Each item in the parenthesized, comma-separated list of data members is
a C++ expression following a certain format. The permitted format is
composed of the functions and types defined in `TupleConverterBase`.

In the expression, `o` is the object of type `T` which was passed as the
argument to `toMetaTuple`. The simplest possible attribute expression is
just `o.m_foo`, where `m_foo` is the name of a data member of `T`. This
expression will result in the data member being entered into the list of
tuple elements with default metadata attached.

Metadata can be added to an element through the `attr` function.
`attr(o.m_foo)` is identical to `o.m_foo`; metadata is added by passing
additional arguments to the `attr` function.

# Metadata

These are the kinds of metadata which can be attached to the tuple
elements:

- Flags
    - Flags are used to conditionally eliminate particular members from participating in certain operations. For example, the flag `DisabledForDBus` will cause the member to be ignored when streaming to DBus. The default flags is zero, meaning that a member with default metadata will participate in all operations using `toMetaTuple`.
- JSON name
    - Every member has an associated name which is used when serializing to/from JSON. The default is the name of the member with the `m_` prefix removed.

# Example


```cpp
BLACK_DECLARE_TUPLE_CONVERSION(BlackMisc::CFoo, (
    o.m_apple,                                     // default metadata
    attr(o.m_orange, "lemon"),                     // with explicit JSON name
    attr(o.m_banana, flags<DisabledForHashing>())  // with a flag
))
```

In this example, `m_apple` has default metadata, `m_orange` has a JSON
name of `lemon`, and `m_banana` will not participate in hashing.

# Compatibility with previous versions


The following functions are provided for API compatibility with an
earlier version of the tuple system:

- `TupleConverter<T>::toTuple`
    - This works like `toMetaTuple`, but it ignores *all* metadata.
- `TupleConverter<T>::jsonMembers`
    - This returns a `QStringList` of the JSON names of all the members. This is no longer necessary when using `toMetaTuple`.
