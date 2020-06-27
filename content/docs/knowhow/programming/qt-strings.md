---
title: Qt Strings (QString)
---

== Qt Strings Overview ==

The best way to know which code construct to use in a given situation is
to understand the API of the facilities you use, and what they provide.

===== String producers =====

-   !!\**\`QString\`*\*!!

    > -   **\`QString\` is a class that owns a shared,
    >     dynamically-allocated UTF-16 string.** The sharing is detached
    >     (so the string data is copied) when any non-const operation is
    >     performed (copy-on-write). When constructing a
    >     [QString]{.title-ref} from a string literal, the data is
    >     always copied.

-   !!\**\`QStringLiteral\`*\*!!

    > -   **\`QStringLiteral\` is a macro that \"returns\" a
    >     \`QString\`.** The internal shared data of the
    >     [QString]{.title-ref} is prepared at compile-time, not
    >     dynamically allocated, and not copied. If you have a string
    >     literal, and you need a [QString]{.title-ref}, then
    >     [QStringLiteral]{.title-ref} is what you want. But you don\'t
    >     always need a [QString]{.title-ref}. In situations where you
    >     //don\'t// need a [QString]{.title-ref}, it is a waste of time
    >     to use [QStringLiteral]{.title-ref}.

-   !!\**\`QLatin1String\`*\*!!

    > -   **\`QLatin1String\` is a class that holds a \`const char\*\`
    >     pointing to a string literal.** Its use cases are limited, as
    >     converting it to a [QString]{.title-ref} involves converting
    >     the Latin-1 data into UTF-16. Certain Qt functions are
    >     overloaded for [QLatin1String]{.title-ref} because they can
    >     directly use the Latin-1 data without converting it to UTF-16.
    >     For example, JSON keys can be passed as
    >     [QLatin1String]{.title-ref}. In such cases, using a
    >     [QString]{.title-ref} would perform an unnecessary allocation
    >     and convertion from Latin-1 to UTF-16 and back again.

-   !!\**\`QStringView\`*\*!!

    > -   **\`QStringView\` is a class that holds a \`const
    >     char16\_t\*\` pointing to some UTF-16 string.** It is often
    >     useful as a function parameter type. If you write a function
    >     that takes a string parameter, which it uses and then
    >     discards, it can be beneficial to declare the parameter as
    >     [QStringView]{.title-ref}. The caller can then choose to pass
    >     a string to your function using whatever type is most
    >     convenient to them. If they had a [char16\_t\*]{.title-ref}
    >     then they would not be forced to construct an unnecessary
    >     [QString]{.title-ref} just to be able to pass it to your
    >     function.
    > -   If your function really does need a [QString]{.title-ref},
    >     don\'t use [QStringView]{.title-ref} as it would inhibit the
    >     implicit sharing feature of [QString]{.title-ref}.
    > -   Because [QStringView]{.title-ref} is such a simple class, it
    >     is more efficient to pass it by value, not reference.

-   !!\**\`QStringRef\`*\*!!

    > -   **\`QStringRef\` is a class that references a substring of an
    >     existing \`QString\` without copying it.** This can be useful
    >     when working with substrings, where you would otherwise be
    >     allocating unnecessary temporary [QString]{.title-ref}
    >     instances to copy substrings into them. For example,
    >     [s.leftRef(3).trimmed()]{.title-ref} instead of
    >     [s.left(3).trimmed()]{.title-ref}.
    > -   Of particular note is [QString::splitRef]{.title-ref}, which
    >     is like [split]{.title-ref} except that it returns a
    >     [QVector\<QStringRef\>]{.title-ref} instead of a
    >     [QStringList]{.title-ref}. Using [QStringList]{.title-ref}
    >     would be very inefficient if you just want to loop over the
    >     parts, as it would reallocate and copy every single one for no
    >     reason.
    > -   Just make sure that the [QStringRef]{.title-ref} gets
    >     destroyed //before// its referenced [QString]{.title-ref},
    >     otherwise this would be a dangling reference.

-   !!\**\`QChar\`*\*!!

    > -   **\`QChar\` is a class that contains a single UTF-16
    >     character.**

-   !!\**\`QLatin1Char\`*\*!!

    > -   **\`QLatin1Char\` is a class that contains a single Latin-1
    >     character.**

===== String consumers =====

-   !!\**QString::arg*\*!!

    > -   **\`arg\` is a member function of QString,** so obviously if
    >     you want to call [arg]{.title-ref} then you need a
    >     [QString]{.title-ref} to call it on. So if you want to call
    >     [arg]{.title-ref} on a string literal, then you almost always
    >     want [QStringLiteral]{.title-ref}. The same goes for other
    >     member functions of [QString]{.title-ref}. But note that
    >     [QStringView]{.title-ref} and [QStringRef]{.title-ref} provide
    >     many of the same methods.

-   !!\**operator %*\*!!

    > -   **The % operator provides more efficient string
    >     concatenation** when [\<QStringBuilder\>]{.title-ref} is
    >     included. Instead of using lots of temporary
    >     [QString]{.title-ref} objects to store each subexpression
    >     (like [+]{.title-ref} does) it collects the parts together and
    >     concatenates them all in one go.
    > -   You should look in the [qstringbuilder.h]{.title-ref} header
    >     to see which types can be concatenated. The class template
    >     [QConcatenable]{.title-ref} is specialised on each
    >     concatenable type: [QString]{.title-ref},
    >     [QStringRef]{.title-ref}, [QStringView]{.title-ref},
    >     [char16\_t\*]{.title-ref}, etc. So for string literals, these
    >     can be concatenated directly as UTF-16 literals, without any
    >     [QString]{.title-ref}-based intermediary.
    > -   One rare exception to the above rule: if every type in a given
    >     concatenation is a fundamental type like [char\*]{.title-ref}
    >     or [char16\_t\*]{.title-ref}, it will fail to compile. This is
    >     because operators can obviously not be overloaded on built-in
    >     types. At least one of the parts of the concatenation must be
    >     a class type. The best workaround is [QStringView]{.title-ref}
    >     as it is the most lightweight.

== TL;DR ==

It can take time and experience to cement the understanding in the brain
so that it becomes intuitive (to become \"fluent\"). Therefore when
working with string literals you can use the following cheat sheet that
should cover most situations:

  --------------------------------------------------------------------------
                        Empty string    Single character Multiple characters
  --------------------- --------------- ---------------- -------------------
  Store in a QString    QString()       QStringLiteral   QStringLiteral

  Concatenate with %                    u\'\'            u\"\"

  As QLatin1String      QLatin1String   QLatin1String    QLatin1String
  param                                                  

  As QStringView param  u\"\"           u\"\"            u\"\"
  --------------------------------------------------------------------------
