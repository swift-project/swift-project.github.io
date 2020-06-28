---
title: Flight plan
---

::: {.important}
::: {.title}
Important
:::

If the flight plan window is too small for you, see
`swiftuiconcepts`{.interpreted-text role="ref"} . You can display the FP
in its own window. And use the tooltips for the various input fields if
you need help!
:::

Standard operations
===================

-   load/send to send or load to /from used network

-   load/save to save or load from disk

    > -   vPilot format
    > -   SB4 format
    > -   *swift* JSON format

Actions:

![image](http://img.swift-project.org/swift_Flight_Plan_buttons.png)

-   validate checks flighplan
-   strict decides if strict check rules are applied
-   prefill fills flight plan based on current aircraft
-   reset the flight plan

Download from SimBrief
======================

![image](http://img.swift-project.org/simbrief.png)

Synchronize flight plan with simulator data
===========================================

If your aircraft model (the one you fly) is known in the DB **AND** the
flight plan was **NOT** sent yet, then your flight plan plan will be
automatically updated (ICAO, callsign) whenever you change your aircraft
in the simulator.

If you wish to override your flight plan data with the simulator data
regardless of the state, you can use the \"circle\" icon next to the
callsign.

![image](http://img.swift-project.org/fp.png)

Altitude popup, metric altitudes
================================

You can use the altitude dialog to enter metric altitudes or get help
with the altitude entry

![image](http://img.swift-project.org/Altitude_dialog.png)

Flight plan numbering
=====================

The *swift* numbering is based on the [FAA flight
plan](https://upload.wikimedia.org/wikipedia/commons/e/e4/Flightplan.PNG).
Aircraft/equipment (3) is split into 2 fields (*swift*), remarks (11)
are at the bottom.

Remember remarks
================

As it can be useful to reuse recently sent remarks you can now use the
remarks history. Just click the remarks buttons to fill in the remarks
fields.

![image](http://img.swift-project.org/remarks.png)

Flight plan of other Aircraft
=============================

You can see the flight plan of other aircraft from the aircraft views
context menu.
