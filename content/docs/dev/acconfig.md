---
title: 'Draft protocol spec: aircraft parts configuration packets for
  FSD'
---

::: {.warning}
::: {.title}
Warning
:::

This protocol specification is work in progress. Do not yet use it for
implementation.
:::

Introduction
============

This specification is meant to be an extension to the existing
propritary VATSIM protocol. This is driven by the fact, that the VATSIM
protocol is lacking several important information like the position of
gear, flaps, setting of lights or even the an on-ground flag. The idea
of this protocol extension is to use JSON objects to have a easy to
extend and easy to read paackage. It is sent via the custom packet
functionality of FSD. This means, you are able to send each JSON string
to a specific callsign.

Why JSON?
=========

-   It is easy for humans to read and write. It is easy for machines to
    parse and generate.

-   Almost every information can be sent as JSON object

    > -   Objects can be nested
    > -   All relevant data types are available

-   Information are sent as objects. Although we have **not** yet
    discussed it, this could be a solution for FSD 2.0 as well.

-   JSON is well supported by frameworks: <http://www.json.org/>

-   JSON is de facto standard for data transfer via web services

-   Easy to extend without breaking compatibility, new attributes can
    just be added.

Example:

``` {.js}
{
    "strobe": false,
    "landing": false
}
```

could be easily extended to

``` {.js}
{
    "strobe": false,
    "landing": false,
    "taxi": true,
}
```

Very likely the 2nd response is still compliant with legacy systems of
the first generation.

-   Character encoding (see below) will allow us to use the full unicode
    set and hence avoids encoding issues as in the current FSD packages.

JSON DataTypes
==============

The following tables shows all possible JSON types:

  --------------------------------------------------------------------
  Type         Description
  ------------ -------------------------------------------------------
  Number       double-precision floating-point format in JavaScript

  String       double-quoted Unicode with backslash escaping

  Boolean      true or false

  Array        an ordered sequence of values

  Value        it can be a string, a number, true or false, null etc

  Object       an unordered collection of key:value pairs

  Whitespace   can be used between any pair of tokens

  null         empty
  --------------------------------------------------------------------

Object Definitions
==================

Lights
------

The lights object is used to synchronize the aircraft lights.

``` {.js}
{
    "strobe": false,
    "landing": false,
    "taxi": true,
    "beacon": false,
    "nav": true,
    "logo": false
}
```

Each light can be switched on or off individually.

Values:

`true`: Light is switched on.

`false`: Light is switched off.

default: Light is switched on.

::: {.note}
::: {.title}
Note
:::

Ross: FSX supports toggling the recognition lights. How about adding a
\"recog\" property to the lights object?
:::

Gear
----

The gear object contains maximum 3 positions.

::: {.note}
::: {.title}
Note
:::

Ross: do we really need three separate gear values? If the three values
didn\'t all have the same value, that would mean a gear malfunction, and
that\'s extremely rare. I don\'t think it\'s worth the extra packet
size.
:::

::: {.note}
::: {.title}
Note
:::

Mat: I like the idea of being able to observe asymmetric gear failure.
The packet is only sent when something changes. If packet size was such
a big deal we wouldn\'t be using plain text. But the three position
maximum is insufficient for all aircraft types (e.g. 747 needs four:
left, center, right, and nose). If the choice is between one value and
three values, I prefer one. But I also think we could come up with a
solution to support an arbitrary number of values, and still have the
smaller packet size in the case when all values are equal. (e.g. [{
\"all\": true }]{.title-ref} or [{ \"all\": true, \"nose\": false
}]{.title-ref})
:::

::: {.note}
::: {.title}
Note
:::

Ross: Correct me if I\'m wrong, but in order to implement the \"all\"
value, it would need to be a tri-state. There would need to be a way for
the client to know to ignore the value of \"all\" and instead look at
the value of the individual gear positions. Remember that we\'re
omitting values that are equal to the default. Personally I don\'t think
this is worth it for the extremely rare event of a gear malfunction.
:::

``` {.js}
{
    "center": true,
    "left": true,
    "right": true
}
```

Values:

`true`: Gear is extended.

`false`: Gear is retracted.

default: Gear is retracted.

::: {.note}
::: {.title}
Note
:::

Ross: I\'m wondering if the default should be gear down, since that will
be the case for most of the aircraft you encounter during a flight.
:::

::: {.note}
::: {.title}
Note
:::

Mat: agreed.
:::

Flaps
-----

``` {.}
{
    "trailing_edge_flaps": false,
    "leading_edge_flaps": false
}
```

Values:

`true`: Flap is extended.

`false`: Flap is retracted.

default: Flap is retracted.

::: {.note}
::: {.title}
Note
:::

Ross: I propose shortening these property names to
[trailing\_edge]{.title-ref} and [leading\_edge]{.title-ref} since the
[\_flaps]{.title-ref} suffix is redundant.
:::

::: {.note}
::: {.title}
Note
:::

Mat: [flaps]{.title-ref} and [slats]{.title-ref} would be even shorter.
:::

::: {.note}
::: {.title}
Note
:::

Ross: Indeed \... I was suggesting removing the [\_flaps]{.title-ref}
suffix only to remove the redundancy. I wasn\'t looking to save length.
Changing it to [flaps]{.title-ref} and [slats]{.title-ref} would
re-introduce redundancy again since the object name is
[flaps]{.title-ref}. Perhaps we just eliminate the [flaps]{.title-ref}
object and just have top level [flaps]{.title-ref} and
[slats]{.title-ref} properties. (I\'m actually still in favor of a flat
key/value pair list instead of using nested objects anyway. I feel like
the nested object hierarchy just bleeds implementation details into the
protocol, but I don\'t feel all that strongly about it either way.)
:::

::: {.note}
::: {.title}
Note
:::

Mat: If we go with a single value for landing gear, then it would be
consistent to also have a single value covering both flaps and slats.
:::

::: {.note}
::: {.title}
Note
:::

Ross: A single [flaps\_down]{.title-ref} value works for me, because as
far as I know you can\'t have flaps extended without slats (or
vice-versa) unless there\'s a malfunction. At least that\'s the case
with any aircraft I\'ve flown. That\'s also supported by the fact that
there is no SimConnect event for extending/retracting the slats. (No
that that\'s definitive, just pointing it out.)
:::

::: {.note}
::: {.title}
Note
:::

Ross: Once I dug into this a bit more while implementing this
functionality in vPilot, I\'m realizing that it might make more sense to
have the flaps value be an integer (representing the percent of
extension, with zero as the default) rather than a boolean. This would
allow us to distinguish between takeoff and landing flaps settings.
Thoughts?
:::

::: {.note}
::: {.title}
Note
:::

Roland: I had thought about it in the very beginning. If we do it, I
would recommend to send numbers with low frequency or only steps. {nav
Flaps 0 \> Flaps 10 \> Flaps 15} etc.
:::

::: {.note}
::: {.title}
Note
:::

Ross: I considered that as well, but not all aircraft use the same
values for degrees when referencing various levels of flap extension.
How would the client know which levels are supported by any given
aircraft model? Also, FSX/P3D allow reading/writing the flaps value as a
percentage, not as a number of degrees. I assume that\'s because of the
fact that not all aircraft use the same number of degrees for various
flap settings. I\'m not sure how XPlane works in this regard. Should we
move this discussion to the forum thread we already have going? Not sure
who all has access to that\...
:::

::: {.note}
::: {.title}
Note
:::

Discussion continued at
<https://dev.vatsim-germany.org/boards/11/topics/1592?r=2235>
:::

Spoilers
--------

``` {.js}
{
    "left": false,
    "right": false
}
```

Values:

`true`: Spoilers are extended.

`false`: Spoilers are retracted.

default: Spoilers are retracted.

On Ground Flag
--------------

Legacy FSD does not provide information if an aircraft is on ground.
This object will add it.

``` {.js}
"on_ground": true
```

Values:

`true`: Aircraft is on ground.

`false`: Aircraft is flying.

default: Aircraft is flying.

Engines Running Flag
--------------------

``` {.}
"engines_running": true
```

Values:

`true`: Aircraft engines are running.

`false`: Aircraft engines are not running.

default: [true]{.title-ref}.

Default values
--------------

Each Object has a defined default value. In case a key is missing in the
JSON object, the receiver client shall fill missing key/value pairs with
default value. The sending client shall always skip key/value pairs
which are identical to default in order to reduce bandwidth.

Protocol
========

Supporting Clients
------------------

Since this protocol is quite new, all legacy clients will not understand
and ignore aircraft configuration packets. In order to reduce bandwidth
and safe CPU time, the client shall send packets only to clients which
have support for aircraft configuration packets declared in their
[CAPS]{.title-ref} packet. Supporting clients have the following
key/value pair defined:

``` {.}
ACCONFIG=1
```

Packets shall only pushed to clients, which have this [CAPS]{.title-ref}
value defined.

The list of clients is currently:

-   vPilot
-   *swift*

Range
-----

In order to reduce traffic load, the client should send configuration
packets only to remote aircrafts in a defined range (recommended are
`10 nm`, but a client developer might let the user configure it).

Pushing a new Configuration Packet
----------------------------------

When a callsign/aircraft, which accepts configuration packets (see
`CAPS` value), enters the defined range the first time from a client
perspective, the client shall send send a full configuration packet
immediately and also a full packet anytime something has changed. To
reduce bandwidth and size of the packet, default values shall be taken
into account.

``` {.}
{
    "lights": {
        "strobe": false,
        "landing": false,
        "beacon": false,
        "logo": false
    },
    "gear": {
        "center": true,
        "left": true,
        "right": true
    },
    "flaps": {
    },
    "spoilers": {
    },
    "on_ground": true
}
```

Missing pairs in object `lights` have to be replaced by default values.
`flaps` and `spoilers` are empty, this means the default value applies
to all pairs.

::: {.todo}
Maximum length payload?
:::

Character Encoding
==================

To avoid conflicts with non-ASCII characters either in FSD or on the
client side, all non-ASCII characters inside string values shall be
encoded via JSON character escape sequence, defined in the JSON
specification ([RFC4627](http://www.ietf.org/rfc/rfc4627.txt) chapter
2.5 Strings):

-   If the character is in the Basic Multilingual Plane (`U+0000`
    through `U+FFFF`), then it may be represented as a six-character
    sequence: a reverse solidus, followed by the lowercase letter `u`,
    followed by four hexadecimal digits that encode the character\'s
    code point. The hexadecimal letters `A` though `F` can be upper or
    lowercase. So, for example, a string containing only a single
    reverse solidus character may be represented as `"\u005C"`.

Examples:

  --------------------------------------------------
  non-ASCII character   Unicode   Escaped sequence
  --------------------- --------- ------------------
  à                     U+00E0    u00E0

  ȹ                     U+0239    u0239

  Ŧ                     U+0166    u0166

  ý                     U+00FD    u00FD
  --------------------------------------------------

Most JSON parsers support automatically character escaping.

Example Qt implementation to escape characters

``` {.cpp}
#include <QCoreApplication>
#include <QDebug>

QString convertToUnicodeEscaped(const QString &str)
{
    QString escaped;
    for (QString::const_iterator it = str.begin(); it != str.end(); ++it)
    {
        QChar ch = *it;
        ushort code = ch.unicode();
        if (code < 0x80)
        {
            escaped += ch;
        }
        else
        {
            escaped += "\\u";
            escaped += QString::number(code, 16).rightJustified(4, '0');
        }
    }
    return escaped;
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    QString str("This is a Test string with ßÜÖЗдравствуй");

    qDebug() << convertToUnicodeEscaped(str);
```

Output:

``` {.}
This is a Test string with \u00df\u00dc\u00d6\u0417\u0434\u0440\u0430\u0432\u0441\u0442\u0432\u0443\u0439
```

Open questions
==============

Maximum length of payload for such a JSON message. Is the length
sufficient? Btw, what is the maximum length anyway?
