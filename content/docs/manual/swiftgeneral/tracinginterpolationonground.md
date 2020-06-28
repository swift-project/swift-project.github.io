---
title: 'Example: Tracing if aircraft should be on ground'
---

If you see another aircraft floating or below ground, this can have
multiple reasons. It might make sense to trace the interpolation to see
if *swift* \"thinks\" the plane should be on ground.

Upfront:

-   aircraft too high or too low is caused by scenery offsets and/or
    missing/wrong vertical offsets (aka CG), see
    `ongroundscenarios`{.interpreted-text role="ref"}

-   typical causes may include

    > -   missing CG/offset, see `xplanecg`{.interpreted-text
    >     role="ref"}
    > -   wrong XPlane elevation
    > -   missing FSX terrain probe, see `fsxprobe`{.interpreted-text
    >     role="ref"}
    > -   wrong gnd. flag from other party

So checking floating/hovering means to check

1.  the gnd. flag
2.  the offset/CG
3.  the elevation

You can debug the issue in two ways:

1.  \"Live\" as described below, using the interpolation log. display
2.  or recorded as described in `tracinginterpolation`{.interpreted-text
    role="ref"} -\> \"Full HTML log.\"

Understanding the ground flag
=============================

-   if other aircraft send aircraft parts with a ground flag or a gnd.
    flag we know the aircraft should be on ground
-   in all other cases (no gnd. flag) we are guessing if the aircraft is
    supposed to be on ground.

Starting the log. display
=========================

Use `.drv intdisplay` to launch the window. See Interpolation log.
display window for details.

1) Checking gnd. situation (log. display)
=========================================

-   select the aircraft you want to check

![image](http://img.swift-project.org/interpol_ex1.png)

-   you can check the input situations from the network

![image](http://img.swift-project.org/interpol_ex2.png)

-   unter interpolation you can see the interpolated situation for your
    simulator

![image](http://img.swift-project.org/interpol_ex3.png)

-   to refresh press

![image](http://img.swift-project.org/interpol_ex4.png)

-   note that the marked text says it is on ground
-   you could also check the loopback situation, which is the last
    situation we received from the simulator for that aircraft

![image](http://img.swift-project.org/interpol_ex5.png)

2) Checking the CG (aka vertical offset)
========================================

You can check the CG in two ways:

1.  in the interpolation log. display
2.  or in the \"rendered\" aircraft model view.

**interpolation log. display**

In the interpolation tab you can see CG as it is \"really\" used for the
interpolated situation

![image](http://img.swift-project.org/interpol_ex6.png)

You can also check if the simulator CG is available, which is available
in the \"Data flow\" tab.

![image](http://img.swift-project.org/interpol_ex7.png)

Here you can see the CG (as stored in the DB) and if an aircraft has
parts (which means a ground flag is sent on VATSIM).

**Rendered aircraft view**

![image](http://img.swift-project.org/interpol_ex8.png)

`null` values mean the vertical offset/CG is not available.

1.  do not confuse [null]{.title-ref} and zero \"0\". [null]{.title-ref}
    means value is not available, while \"0\" means the values is
    available.
2.  some aircraft have 0 (zero) based offsets (so 0 can be a correct
    value)

![image](http://img.swift-project.org/interpol_ex9.png)

3)  checking the elevation

::: {.important}
::: {.title}
Important
:::

For performance reasons we do not query elevations all the time
:::

-   you can set coordinates (e.g. for your own aircraft) and test if the
    requested elevation is available (means the probe works)
-   you can also check the elevation history and see if there are
    incoming elevation values. Again: please understand we only query
    elevations for aircraft supposed to be \"near ground\".

![image](http://img.swift-project.org/interpol_ex10.png)
