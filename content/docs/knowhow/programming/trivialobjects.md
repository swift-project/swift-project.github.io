---
title: C++ trivial objects
---

From discussion on Discord

\"Primitive\" doesn\'t exist in C++. \"Arithmetic types\" are like
[bool, double, int]{.title-ref}. \"Fundamental types\" include
[arithmetics, void]{.title-ref} and [nullptr\_t]{.title-ref}.
\"Scalars\" include arithmetics, [nullptr\_t]{.title-ref} and pointers.

All scalars are trivial, but some non-scalars are also trivial. There is
no \"quick\" way to see if a class is trivial. You need to look at its
member variables, and its copy ctor, operator=, and dtor. If the member
vars are all trivial, and the copy ctor, operator= and dtor are all
=default then the class is trivial. You can also check:

``` {.}
static_assert(std::is_trivial<MyClass>{}, "blah");
```

For me, trivial is an \"easy\" way to say whether a class doesn\'t need
to be passed by reference. Other trivial classes include
[QStringView]{.title-ref} and [QLatin1String]{.title-ref}.

The performance cost of pass-by-reference is that the compiler has fewer
optimization opportunities, because it has to assume that the value
could be changed by external code.

``` {.cpp}
void throwBall(double value, const CLengthUnit &unit)
{
    hand.hold(ball);
    arm.prepareThrow(value, unit); // here the value of unit is accessed from memory
    //...

    logMessage();

    // if logMessage is defined in another cpp file, the compiler
    // must assume that it could modify the value of unit

    arm.start(value, unit); // here the value of unit must be accessed from memory again,
                            // the compiler can't reuse the value from the previous access
}
```

Because it\'s possible that [throwBall]{.title-ref} could be called like
this sneaky code:

``` {.cpp}
CLengthUnit unit = /*...*/;
void logMessage() { unit = otherUnit; }
throwBall(10, unit);
```

When it\'s passed by value, the parameter is a local variable, so the
compiler can see that it\'s not modified, and only needs to access the
memory once:

``` {.cpp}
void throwBall(double value, CLengthUnit unit)
{
    hand.hold(ball);
    arm.prepareThrow(value, unit); // here the value of unit is accessed from memory
    //...

    logMessage();

    arm.start(value, unit); // here the compiler can just reuse the value from the previous access
}
```

Return values are a bit different, but I would need to have a \"good
reason\" to use references anywhere. [CMeasurementUnit]{.title-ref}
contains just a single non-owning pointer to const data, so it easily
fits in a CPU register like any arithmetic type. operator== hasn\'t been
changed in ages. You might be thinking of [convertFrom]{.title-ref}
which we discussed here: <https://dev.swift-project.org/T207>

Either way, comparing [m\_data == other.m\_data]{.title-ref} pointers is
just as good as comparing [this == &other]{.title-ref} pointers.

Are our normal PQs trivial?

Mat SutcliffeYesterday at 23:47 Yes, actually. Whether they are
\"small\" is another question. CPhysicalQuantity contains just a double
and a CMeasurementUnit (which contains a pointer). So it\'s 128 bits (8
bytes). Could fit in an SSE2 register, so probably \"small\". But it\'s
debatable. And some of our derived PQs add more members, like
magnetic/true for headings, datum for altitudes. Mat SutcliffeYesterday
at 23:56

Actually IMHO the most important thing in all of this is that the
[CMeasurementUnit::Data]{.title-ref} instances be
[constexpr]{.title-ref} as it means they are initialized at
compile-time, so no static order fiasco.

And only \"literal types\" are candidates for [constexpr]{.title-ref},
which is yet another category of type
