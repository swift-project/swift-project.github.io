---
title: Relay event pattern
---

Intent
======

Take an event triggered by an object in one of any number of processes,
and pass it to objects in any number of other processes using DBus,
without requiring those objects to make explicit use of any other class.

Motivation
==========

Consider two or more processes, each one having a `CValueCache` which
must be kept in sync with the `CValueCache` in the other processes. An
change in one of the values in a `CValueCache` is an event which must be
passed to all the other processes. All processes must observe the events
occurring in the same order, to ensure that each `CValueCache` remains
consistent with the others.

Interprocess communication via QtDBus is achieved using concrete Facade
(\"context\") classes and associated Proxy classes. Slots in the
concrete class can be remotely invoked by calling the corresponding slot
of the proxy class, and signals emitted by the concrete class will be
sympathetically emitted by the proxy class. Within this framework,
events must be able to flow in any direction, from any process to any
other process or set of processes.

The concrete class acts as central router. Using `CSettingsCache` as an
example, an event enters the system when the slot
`IContextApplication::changeSettings` is called. The slot arguments
describe the content of the event. If the slot is called in a proxy
class, the call will be forwarded to the concrete class as usual. The
slot in the concrete class will emit the signal
`IContextApplication::settingsChanged` with the same arguments that were
passed to the slot. The corresponding signal will, as usual, be emitted
by all proxy classes in all connected processes. Successive emissions of
the signal will be always be observed in the same order by all
processes, ensuring consistency. A `CIdentifier` parameter can be used
to identify the process which triggered an event, and to detect round
trips.

The class which ultimately sends and receives the events in this example
is `CValueCache`. The facade classes are responsible for establishing
the signal/slot connections, so `CValueCache` has no knowledge of the
facades.

Applicability
=============

Use the Relay Event pattern when a message must be sent between two or
more distributed processes in arbitrary directions. If the signal/slot
connections are established by the facades, then the classes which
ultimately send and receive the events can be completely independent of
the mechanism of interprocess communication.

Structure
=========

![image](http://img.swift-project.org/pattern.png)

Participants
============

-   **Abstract Facade** (`IContextApplication`)

    > -   Declares a pure virtual slot (`changeSettings`) and a signal
    >     (`settingsChanged`). Responsible for connecting its slot to
    >     the Endpoint\'s signal (`CValueCache::valueChangedByLocal`),
    >     and for connecting its signal to the Endpoint\'s slot
    >     (`CValueCache::changeValueFromRemote`).

-   **Concrete Facade** (`CContextApplication`)

    > -   Provides an implementation of the virtual slot, which emits
    >     the signal.

-   **Proxy Facade** (`CContextApplicationProxy`)

    > -   Following the usual pattern of a facade proxy class, provides
    >     an implementation of the virtual slot which forwards the call
    >     to the slot of the Concrete Facade via DBus.

-   **Endpoint** (`CValueCache`)

    > -   A class which calls the slot and/or receives the signal of the
    >     Abstract Facade.

Collaborations
==============

Endpoint classes (like `CValueCache`) in different processes can share
events with each other when they are connected via this pattern.

Consequences
============

Endpoint classes need no knowledge of the mechanism by which their
events are passed around. They are not coupled to the Facade classes,
nor to DBus.

The pattern results in the facades exposing a signal and a slot which
are not intended to be called directly, and should be thought of as
`protected`.

A large number of events could lead to an undesirable DBus performance
issue. This could be mitigated by more intelligently controlling which
events should be relayed.

Implementation
==============

Be aware that processes may join or leave the distributed process
environment at any time. A new process joining may need special handling
to synchronize it with the processes already connected.

Use a `CIdentifier` parameter to identify the process which triggered an
event. `CIdentifier::isFromSameProcess()` will return true in the case
of a round trip. There is a choice to be made, whether round trip
detection should be the responsibility of the Facade or of the Endpoint.
If the Endpoint requires confirmation that its event was received by the
Concrete Facade, then it can obtain this by doing its own round trip
detection, in which case the Facade should not do the detection.

If events should be received only by Proxy Facades and not by the
Concrete Facade (e.g. log messages) then the Facade signal should only
be connected to the Endpoints served by the Proxy Facades. The the
signal of the Concrete Facade should be left unconnected.

Known Uses
==========

-   `cache`{.interpreted-text role="ref"}
-   `logging`{.interpreted-text role="ref"}
-   Hotkey events

Related Patterns
================

Relay Event may be seen as a variation on the Mediator pattern. It could
also be thought of as a multidirectional Observer pattern in which each
Endpoint is an observer of every other Endpoint.

Endpoint classes are often Singletons. Facade classes of course use the
Facade pattern, and Facade Proxies use the Proxy pattern.

The Command pattern suggests encapsulating event properties into a
single value class, to avoid signals and slots with large numbers of
parameters.
