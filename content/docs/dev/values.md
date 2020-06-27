---
title: Design and use of value classes
---

The canonical value class
=========================

Our value classes all follow a similar pattern of common methods:

-   A `registerMetadata` method to register the class with the metatype
    system.
-   Stringification methods to generate a string representation of an
    object.
-   Comparison operators for comparing two objects of the same class.
-   An overload of `qHash` to generate a hash of an object.
-   Methods to marshal and unmarshal an object as a DBus argument.
-   Methods to serialize to and from a JSON structure.
-   A method to get the icon representing the object.
-   Methods to access the properties of the object by an index.

The most common case, in which the methods are implemented using the
`metaclass`{.interpreted-text role="ref"} system, is supported by
deriving the class from `CValueObject`, which is a convenience class
template which derives from all the most commonly used mixin classes,
using multiple inheritance.

Meta types and `CVariant`
=========================

Any of our value objects can be stored in a [CVariant]{.title-ref}, and
the canonical methods of the stored object can be accessed through the
methods of `CVariant`. This is facilitated by a meta type system built
on top of Qt\'s meta type system, using
`BlackMisc::registerMetaValueType()` and [duck
typing](https://en.wikipedia.org/wiki/Duck_typing). This allows value
objects to be treated polymorphically while retaining value semantics
and without introducing virtual methods in the public API.[^1] It is not
neccessary for all of the canonical methods to be present in an object
stored in a `CVariant`; it is a runtime error to attempt to use a method
of a `CVariant` storing an object which doesn\'t support that method.

Mixin classes
=============

::: {.note}
::: {.title}
Note
:::

Some Q&A about mixins from the meetings
[here](https://dev.vatsim-germany.org/boards/22/topics/2672?r=2676#message-2676).
:::

Sometimes it doesn\'t make sense for a particular value class to
implement one or more of the canonical methods. In these cases, instead
of deriving from `CValueObject`, a value class can derive directly from
the specific mixin classes which it needs. This allows for extensive
code reuse through inheritance without violating the [Liskov
substitution
principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle)
and without coupling together unrelated responsibilities. All of the
mixin classes, as well as `CValueObject`, use the
[CRTP](https://en.wikipedia.org/wiki/Curiously_recurring_template_pattern).
Some of the mixins require their template argument type to satisfy
particular
[concepts](https://en.wikipedia.org/wiki/Concept_%28generic_programming%29).
This is documented in their Doxygen class documentation. The concepts
required when deriving from `CValueObject` are the union of all the
required concepts of the mixins which `CValueObject` uses.

Inheritance
===========

Occasionally, we have value classes which represent specializations of
other value classes, and therefore derive from those other value
classes. For example, `CHeading` derives from `CAngle`, and `CAltitude`
derives from `CLength`. In these cases, there is a base class which
derives from certain mixins, and a derived class which derives from the
base class and some other mixins. A base and a derived class might
derive from some of the same mixins. For example, `CAngle` derives from
`Mixin::MetaType<CAngle>` and `CHeading` derives from
`Mixin::MetaType<CHeading>`. In these cases, it is necessary to use a
[using
declaration](http://en.cppreference.com/w/cpp/language/using_declaration#In_class_definition)
to disambiguate which methods should be inherited in the derived class.
In this example, the definition of `CHeading` has a
`using Mixin::MetaType<CHeading>::registerMetadata;` to tell the
compiler that it wants to inherit the `registerMetadata` method of
`Mixin::MetaType<CHeading>`, not the `registerMetadata` method of
`CAngle`. To reduce duplication of these `using` declarations, there are
macros provided with the mixin classes to automatically introduce the
appropriate declarations into a derived class.

[^1]: Virtual methods in frequently-used CRTP class templates have a
    detrimental effect on compilation times, because they inhibit lazy
    instantiation of methods.
