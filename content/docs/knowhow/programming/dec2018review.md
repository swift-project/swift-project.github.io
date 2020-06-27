---
title: DEC 2018 C++ review
---

== QString ==

-   Old: [QStringLiteral(\"{ \") % foo % QStringLiteral(\"
    }\")]{.title-ref}
-   New: [u\"{ \" % foo % u\" }\"]{.title-ref}

When a string is only a single character you can use a UTF-16 character
literal:

-   Old: [QStringLiteral(\"\[\") % foo %
    QStringLiteral(\"\]\")]{.title-ref}
-   New: [u\'\[\' % foo % u\'\]\']{.title-ref}

See full detailed info here: \[\[ knowhow/programming/qt-strings/ \]\]

== Loops ==

One more performance point: to loop over the values of a
[QHash]{.title-ref} or [QMap]{.title-ref} or [CDictionary]{.title-ref}
there is no need to call [.values()]{.title-ref}, just loop over the
container itself:

``` {.cpp}
for (const auto &value : map.values()) { ... } // old
for (const auto &value : map) { ... }          // new
```

Calling [.values()]{.title-ref} is just copying them into a
[QList]{.title-ref} for no reason. Furthermore, to loop over the keys,
we have [makeKeysRange]{.title-ref} in \`blackmisc/range.h\`:

``` {.cpp}
for (const auto &key : map.keys()) { ... }         // old
for (const auto &key : makeKeysRange(map)) { ... } // new
```

This avoids copying the keys into a [QList]{.title-ref}, as it just
adapts the begin and end iterators. And to loop over keys //and//
values, we have \`makePairsRange\`:

``` {.cpp}
for (const auto &key : map.keys()) /*********** old */
{
    doSomethingWithKey(key);
    doSomethingWithValue(map[key]);
}
for (const auto pair : makePairsRange(map)) /* new */
{
    doSomethingWithKey(pair.first);
    doSomethingWithValue(pair.second);
}
```

This avoids copying the keys into a [QList]{.title-ref} //and//
performing a lookup for each one. In C++17 we will be able to unpack the
pair like this:

``` {.cpp}
for (const auto [key, value] : makePairsRange(map))
{
    doSomethingWithKey(key);
    doSomethingWithValue(value);
}
```

I think I have fixed it to use these everywhere possible in our
codebase. Caveat: [makeKeysRange]{.title-ref} and
[makePairsRange]{.title-ref} only work with lvalues. You will get a
compile error if you try to use them with rvalues, because it would be
unsafe.
