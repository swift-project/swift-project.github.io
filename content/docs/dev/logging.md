---
title: Logging
---

Sending log messages
====================

Simple generic messages
-----------------------

The `qDebug`, `qWarning`, and `qCritical`
[macros](http://qt-project.org/doc/qt-5/debug.html#warning-and-debugging-messages)
can be used for sending quick and simple messages for development
purposes. By default, they are always emitted to the console. They can
also be picked up by `BlackMisc::CLogHandler`, just like the categorized
messages can.

Categorized messages
--------------------

::: {.todo}
See also: `CLogMessage` doxygen link.
:::

Giving each message a category allows it to be handled more
intelligently. Qt provides native support for [logging
categories](http://qt-project.org/doc/qt-5/qloggingcategory.html).
`BlackMisc::CLogMessage` is a wrapper around
[QDebug](http://qt-project.org/doc/qt-5/qdebug.html) with a slightly
different API. The normal use case is based around creating a temporary
instance of `CLogMessage`. When the temporary is destroyed at the end of
the full expression, the message is sent, which is similar to how
`QDebug` works.

The default category
--------------------

If `CLogMessage` is used without specifying a category, then the value
`CLogMessage::defaultMessageCategory()` is used (`"swift"`).

This will send a debug message created by concatenating the streamed
values:

``` {.cpp}
CLogMessage() << "the time is" << time << "and there are" << planes.size() << "planes in the sky";
```

This will send an info message created by substituting the `%1`,
`%2`,\... placeholders for the streamed values: (see QString
documentation)

``` {.cpp}
CLogMessage().info("The time is %1 and there are %2 planes in the sky") << time << planes.size();
```

Similarly these will send a warning or error message:

``` {.cpp}
CLogMessage().warning("%1 is not a valid ICAO code") << icao;
CLogMessage().error("%1 is not a valid ICAO code") << icao;
```

Specifying a category
---------------------

An explicit category string can be specified when using `CLogMessage`.

This will send a debug message created by concatenating the streamed
values:

``` {.cpp}
CLogMessage().debug("swift.planes.counter.timed") << "the time is" << time << "and there are" << planes.size() << "planes in the sky";
```

This will send an info message created by substituting the `%1`,
`%2`,\... placeholders for the streamed values:

``` {.cpp}
CLogMessage().info("swift.planes.counter.timed", "The time is %1 and there are %2 planes in the sky") << time << planes.size();
```

Similarly these will send a warning or error message:

``` {.cpp}
CLogMessage().warning("swift.icao.validation", "%1 is not a valid ICAO code") << icao;
CLogMessage().error("swift.icao.validation", "%1 is not a valid ICAO code") << icao;
```

Parameterizing the category
---------------------------

Hard-coded category strings are hard to maintain and easy to get wrong.
Instead of passing an explicit string, it is possible to pass a pointer
to any object of class type, and the category string will be obtained by
calling `->getMessageCategory()` on that pointer.

A class which sends log messages should define its own category string
method:

``` {.cpp}
class CTimedPlaneCounter
{
public:
    static QString getMessageCategory() { return "swift.planes.counter.timed"; }
    //...
};
```

Then this will send a debug message created by concatenating the
streamed values:

``` {.cpp}
void CTimedPlaneCounter::count()
{
    //...
    CLogMessage().debug(this) << "the time is" << time << "and there are" << planes.size() << "planes in the sky";
}
```

This will send an info message created by substituting the `%1`,
`%2`,\... placeholders for the streamed values:

``` {.cpp}
void CTimedPlaneCounter::count()
{
    //...
    CLogMessage().info(this, "The time is %1 and there are %2 planes in the sky") << time << planes.size();
}
```

Similarly these will send a warning or error message:

``` {.cpp}
void CIcaoValidator::validate()
{
    //...
    CLogMessage().warning(this, "%1 is not a valid ICAO code") << icao;
    CLogMessage().error(this, "%1 is not a valid ICAO code") << icao;
}
```

Directly returning log messages
===============================

`CLogMessage` is implicitly convertible to `CStatusMessage`. This means
that a `CLogMessage` expression can appear in a `return` statement of a
method which returns `CStatusMessage`, so the caller of the method can
have direct, synchronous access to the message which was the result of
the method:

``` {.cpp}
CStatusMessage CFoo::doSomething()
{
    //...
    return CLogMessage() << "something went wrong";
}
```

The message is still emitted and can still be handled by `CLogHandler`
as normal. See \"Implementation challenges\" below for information on
avoiding double handling of such messages.

Receiving log messages
======================

Signals for all messages
------------------------

::: {.todo}
See also: `CStatusMessage` doxygen link.
:::

`CLogHandler` is a class for subscribing to log messages in different
categories. The singleton pointer is obtained from
`CLogHandler::instance()`.

::: {.warning}
::: {.title}
Warning
:::

`CLogHandler` can not be used in plugins, because of the singleton
pattern.
:::

The application\'s `main` function should call
`CLogHandler::instance()->install()` to tell the handler to install
itself as the Qt message handler using
[qInstallMessageHandler](http://qt-project.org/doc/qt-5/qtglobal.html#qInstallMessageHandler).

`CLogHandler` has two signals which can be connected to:
`localMessageLogged` which is emitted when a message is logged in this
process, and `remoteMessageLogged` which is emitted when a message is
relayed from a different process via DBus.

Signals for specific message categories
=======================================

::: {.todo}
See also: `CStatusMessage` doxygen link.
:::

`CLogHandler` has a method `handlerForCategory` which takes a
`QString prefix` and returns a pointer to a `CLogCategoryHandler` which
associates itself with all messages whose category strings start with
the given prefix.

`CLogCategoryHandler` has one signal which can be connected to:
`messageLogged` which is emitted whenever a message is logged whose
category string starts with the associated prefix.

Console output
--------------

By default, all log messages are forwarded to the Qt default message
handler which prints them to the console. `CLogHandler` has a method
`enableConsoleOutput(bool)` for disabling this behaviour.
`CLogCategoryHandler` also has a method `enableConsoleOutput(bool)` for
enabling or disabling this behaviour at the category level.

Relaying over DBus
------------------

The application context is responsible for relaying the log messages
between the `CLogHandler` instances of different processes.

Subscribing
===========

You can create a `CLogPattern` to match various kinds of messages, and
then pass the `CLogPattern` to `CLogHandler` to obtain a handler whose
`messageLogged` signal will be emitted when a message matching your
`CLogPattern` is logged.

A `CLogPattern` can match messages by severity, category, combinations
of categories and severities, category prefixes, suffixes and
substrings.

Usage examples

``` {.cpp}
// a pattern which matches all warnings
auto pattern = CLogPattern().withSeverity(CStatusMessage::SeverityWarning);

// subscribe to all warnings
auto *handler = CLogHandler::instance()->handlerForPattern(CLogPattern().withSeverity(CStatusMessage::SeverityWarning));
connect(handler, &CLogPatternHandler::messageLogged, this, &CFoo::mySlot);

// subscribe to all errors
auto *handler = CLogHandler::instance()->handlerForPattern(CLogPattern().withSeverity(CStatusMessage::SeverityError));
connect(handler, &CLogPatternHandler::messageLogged, this, &CFoo::mySlot);

// subscribe to all warnings and errors
auto *handler = CLogHandler::instance()->handlerForPattern(CLogPattern().withSeverityAtOrAbove(CStatusMessage::SeverityWarning));
connect(handler, &CLogPatternHandler::messageLogged, this, &CFoo::mySlot);

// subscribe to all validation warnings and validation errors
auto *handler = CLogHandler::instance()->handlerForPattern(CLogPattern::exactMatch(CLogCategory::validation()).withSeverityAtOrAbove(CStatusMessage::SeverityWarning));
connect(handler, &CLogPatternHandler::messageLogged, this, &CFoo::mySlot);

// convenience to get the handler and connect the signal in the same step
CLogHandler::instance()->handlerForPattern(CLogPattern::exactMatch(CLogCategory::validation()).withSeverityAtOrAbove(CStatusMessage::SeverityWarning))->subscribe(this, &CFoo::mySlot);

// convenience for validation messages
CLogHandler::instance()->handlerForValidation()->subscribe(this, &CFoo::mySlot);
```

`CLogPattern` uses `QSet` internally, which made it difficult to use the
meta tuple. I had to implement some of the `CValueObject` methods by
hand. I didn\'t bother trying to find a clever workaround as I\'m going
to be refactoring `CValueObject` soon anyway.

The `topologicalSort` and `isProperSubsetOf` stuff allows `CLogPattern`
to be sorted by generality, so more specific patterns come first. For
example, `CLogPattern::startsWith("foo")` is more general than
`CLogPattern::startsWith("foobar")` because the latter matches a proper
subset of the messages which the former matches. This is not compatible
with the standard sorting algorithms, because in the case of
`CLogPattern::startsWith("foo")` and `CLogPattern::startsWith("bar")`
neither one is a subset of the other, so it is unspecified which should
come first. This functionality is used by the mechanism for selectively
enabling console output. If console output is enabled for messages
matching `CLogPattern::startsWith("foo")` but disabled for messages
matching `CLogPattern::startsWith("bar")` then the setting for the more
specific pattern will win.

Implementation challenges
=========================

Qt only supports three standard message severities: `QtDebugMsg`,
`QtWarningMsg`, and `QtCriticalMsg`. It is necessary to map these to our
four message severities: `Debug`, `Info`, `Warning`, and `Error`.

`CLogMessage` is implicitly convertible to `CStatusMessage` for directly
returning from the method which generated it (see \"Directly returning
log messages\" above). In order to avoid double handling of such
messages, we need a way to mark messages as having been already
potentially handled by direct return value.

The solution to both of the above two problems is category suffix codes.
When the message is being passed through Qt\'s message logging
framework, we add suffixes to the category string to mark these flags.
When handling the message, the suffixes are removed, so the user of
`CLogMessage` and `CLogHandler` are not aware of them.

The `isRedundant` method of `CStatusMessage` can be used in a slot
connected to one of the `CLogHandler` or `CLogCategoryHandler` signals,
to detect if the message was already potentially handled by a direct
return value from the method which generated it.
