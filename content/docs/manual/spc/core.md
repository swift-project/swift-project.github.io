---
title: swift core
---

see also `distributedswift`{.interpreted-text role="ref"}

The swift core
==============

-   the swift core is containing the central pilot client functionality

    > -   connect to the network (e.g. VATSIM, local FSD server etc.)
    > -   connect to the simulator (via a plugin driver)
    > -   doing the model matching
    > -   voice connectivity

-   Operations:

    > -   The swift pilot client can be run as one executable together
    >     with the UI (core included)
    > -   or the core runs independently from the UI (2 executables),
    >     interacting with the UI via DBus

![image](http://img.swift-project.org/swift_core.png)
