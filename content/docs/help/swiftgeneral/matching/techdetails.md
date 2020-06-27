---
title: Matching script technical details and matching script examples
---

This document covers some technical details for matching script
programmers

Matching script interacting with swift
======================================

There are classes, which may be used as objects in Matching script (i.e.
JavaScript). Those classes start with a
`` MS`prefix (matching script). Those classes can be found in :code:`BlackMisc::Simulation ``
and `BlackCore`. You can find the latest documentation here: [Doxygen
build](https://build.swift-project.org/job/swift_pilotclient_doxygen/Doxygen/)

-   MSInOutValues
-   MSModelSet
-   MSWebServices

Best to check the latest [Doxygen
build](https://build.swift-project.org/job/swift_pilotclient_doxygen/Doxygen/)
for these classes as there may be various changes for each version.

Using properties
================

MS class properties as below

``` {.}
//! MSNetworkValues properties @{
Q_PROPERTY(QString callsign           READ getCallsign           WRITE setCallsign           NOTIFY callsignChanged)
Q_PROPERTY(QString callsignAsSet      READ getCallsignAsSet)
Q_PROPERTY(QString flightNumber       READ getFlightNumber)
Q_PROPERTY(int     dbAircraftIcaoId   READ getDbAircraftIcaoId   WRITE setDbAircraftIcaoId   NOTIFY 
```

can be used in matching script as follows

``` {.}
outObject.aircraftIcao = "C172";
outObject.modified     = true; // tell we changed something
```

Some properties are read only, and you can see the type from property
definition.

Using functions
===============

Functions of MS classes can be used if they are marked as `Q_INVOKABLE`
(only those you can invoke from matching script).

``` {.}
//! Functions calling the web services @{
Q_INVOKABLE int countAircraftIcaoCodesForDesignator(const QString &designator) const;
Q_INVOKABLE int countAirlineIcaoCodesForDesignator(const QString &designator) const;
//! @}
```

or

``` {.}
//! Model string of model with closest color distance
Q_INVOKABLE QString findCombinedTypeWithClosestColorLivery(const QString &combinedType, const QString &rgbColor) const;
```

Those you can call those as functions in matching script

`var mscl = modelSet.findCombinedTypeWithClosestColorLivery(combinedType, white);`

Examples
========

Check out the [matchingscript]{.title-ref} directory for examples, like
`\swift-0.9.2-64bit\share\matchingscript`.
