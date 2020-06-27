---
title: Facade classes (aka contexts)
---

{{% alert title="Note" color="primary" %}}
*Boon and bane*
{{% /alert %}}

Characteristics of the contexts:
================================

-   Facade for a set of domain functionality
-   Smallest unit registered with DBus, hence smallest unit which can be
    used remotely

Characteristics of the runtime
==============================

-   Owns the DBus server (if applicable, server side) or the DBus
    connection (client side) - `initDBusServer`
-   Factory for contexts
-   Loads the settings (not only for other contexts, but also DBus
    server)
-   Connects cross context signal / slots (`initPostSetup`)

Cross context dependency
========================

| context / depends on | audio | app | network | settings | simulator | own aircraft |
|----------------------|-------|-----|---------|----------|-----------|--------------|
| audio                |       |     |         |          |           |              |
| application          | x     |     | x       | x        | x         | x            |
| network              | x     |     |         |          |           | x            |
| settings             | x     | x   | x       |          | x         | x            |
| simulator            |       |     | x       |          |           | x            |
| own aircraft         | x     |     |         |          | x         |              |

Review (for future swift versions)
==================================

Know shortcomings:

-   Cross dependencies, the ideal design goal is to have independent
    contexts. The idea was that each context can be enabled/disabled,
    but the goal was not achieved.
-   DBus communication is not bidirectional. The audio context can run
    on core or on GUI, but the proxy/implementation object can not just
    be switched (at least not for peer 2 peer DBus).
-   Our design was planned around the runtime/contexts. But
    launcher/mapping tool do not need contexts.

Keep in mind for future versions:

-   We still transfer mass data (i.e. relatively large amounts of data, like all remote aircraft or models).
-   Therefore we use pull to avoid overloads.
-   Any future distributed objects system needs to consider that. Automatic object distribution might be fatal.
