---
title: swift launcher
weight: 10
---

![image](http://img.swift-project.org/Launcher_core_mode.png)

-   The launcher is started when swift is installed

-   You can use it to configure

    > -   how swift is started (standalone, distributed)
    > -   how the UI looks

-   to download updates

-   and model data from `swift datastore <datastore>`{.interpreted-text
    role="ref"}

start a standalone / distributed swift
======================================

1.  To start standalone just select this mode and press the blue GUI
    button.

2.  To start a distributed swift, select the mode:

    > 1.  If you want to run both (core/UI) on the same machine try to
    >     start the core on session bus, then the UI also on session
    >     bus.
    > 2.  If this does not work, try P2P on localhost and the client on
    >     localhost.
    > 3.  If you run on 2 machines, start P2P core on machine on machine
    >     A, and P2P UI on machine B (of course the IP-address needs to
    >     be correct).

3.  Hint: You can also start a distributed version via command line
    arguments: `swiftcmdargs`{.interpreted-text role="ref"}

checking for updates / new data
===============================

![image](http://img.swift-project.org/Launcher_updates.png)

1.  swift comes in different versions

2.  select the appropriate channel

    > 1.  For alpha you need to be a registered user. Read here about
    >     the `alpha program <alpha>`{.interpreted-text role="ref"}
    > 2.  stable is the channel for \"normal\" users.
    > 3.  you can switch the channel at anytime, also you can
    >     `install multiple swift versions <installation>`{.interpreted-text
    >     role="ref"}

3.  see here which
    `version to download <publicdownload>`{.interpreted-text role="ref"}

configuration wizard
====================

You can start the configuration wizard from the launcher. Normally the
configuration wizard will be launched when the installer finishes. The
configuration wizard allows you to set default values for the most
important setting values and download the DB data.

See `launcher_wizard`{.interpreted-text role="ref"}
