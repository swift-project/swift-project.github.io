---
title: Simulator elevation
---

Why do we need the elevation?
=============================

Having the real elevation in the used simulator with the used scenery we
can

-   calculate the AGL (\"above ground\")
-   avoid model underflows, see also
    `ongroundscenarios`{.interpreted-text role="ref"}
-   `xivapclamp`{.interpreted-text role="ref"}

There are 2 general concepts
============================

From 0.8.4 onward we use \"probing\" for all incoming network positions
(likely to be \"near gnd. relevant\")

-   Probing the elevation at a given position (like we do it for XPlane,
    since 0.8.4. also possible with P3D/FSX)

    > -   Pro: Accurate elevation at a given position
    > -   Con: \"Slow\" (means slow in the context of interpolation)

-   Using the elevation at the current AI (remote) aircraft position (as
    in P3D, FSX)

    > -   Pro: Fast, as it can be retrieved in the SimConnect loop
    > -   Con: Only at the current (interpolated) position, not at the
    >     next or previous situation

see also `openresearch`{.interpreted-text role="ref"}
