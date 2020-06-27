---
title: Shared State
---

::: {.warning}
::: {.title}
Warning
:::

This documentation concerns a work-in-progress in the wip/T36 branch.
:::

`BlackMisc::SharedState` is a hierarchical library of reusable building
blocks for composing subsystems for sharing transient data between
objects, potentially in different processes.

Endpoint Layer
==============

The middle layer contains the mutators and observers. Mutators and
observers correspond to commands and queries in the CQRS pattern.
Mutators and observers can be passive and/or active, as seen in this 2x2
matrix:

  --------------------------------------------------
             Passive             Active
  ---------- ------------------- -------------------
  Mutator    publishes events    handles requests

  Observer   subscribes events   submits requests
  --------------------------------------------------

Events are fire-and-forget signals sent by passive mutators and received
by passive observers. Requests are stateful signals that expect replies;
requests are sent by active observers and received by active mutators,
which send replies back to the observers that sent the requests.

Events and requests are sent across \"channels\". Each channel can have
multiple mutators and multiple observers. Each mutator and each observer
is on exactly one channel. For an observer to communicate with a
mutator, they must both be on the same channel. Conceptually, a channel
is just a unique key string.

These concepts are implemented by concrete
`QObject subclasses`:`CPassiveMutator`, `CPassiveObserver`,
`CActiveMutator`, `CActiveObserver`. Instances of these classes are
created by calling their static `create()` method, which returns a
`std::shared_ptr` pointing to the new object. Their channel is
determined by the `BLACK_SHARED_STATE_CHANNEL` macro in the class of
their parent object, combined with the name of their parent object.

Transport/Datalink Layer
========================

The middle layer is completely decoupled from the mechanism for
transporting events and requests. This mechanism is the responsibility
of the bottom layer. `IDataLink` is an abstract interface that is
implemented by concrete subclasses to provide different transport
mechanisms. When constructing a mutator or observer, a pointer to the
`IDataLink` implementation is supplied as a parameter to the `create()`
method.

Content/Subject Layer
=====================

The middle layer is also completely decoupled from the payloads carried
by the events, requests, and replies, which are handled by the top
layer. A payload is a `CVariant`, and its contents are opaque to the
mutators and observers. It is for the parent objects of the mutators and
observers to confer meaning upon the events and requests that they send
and receive.

References
==========

-   CQRS pattern:

    > -   <http://codebetter.com/gregyoung/2010/02/16/cqrs-task-based-uis-event-sourcing-agh/>
    > -   <http://cqrs.nu/Faq/command-query-responsibility-segregation>
    > -   <http://martinfowler.com/bliki/CQRS.html>

Diagram
=======

![image](http://img.swift-project.org/sharedstate.png)
