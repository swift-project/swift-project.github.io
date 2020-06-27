---
title: Aircraft parts and gnd. flag / ground flag
---

Aircraft parts
==============

Aircraft parts are used to transfer aircraft information about \"gear\",
\"spoilers\", \"flaps\", \"lights\". They also transfer a **GND flag**
to tell if the aircraft is located on ground. VATSIM uses the parts
ground flag.

Ground. flag / gnd. flag
========================

In the FSD protocol and the related extensions there are 2 ways to
transfer a ground flag. *swift* supports both:

-   along with the aircraft parts (VATSIM)
-   and as flag in the aircraft position

How should it be set?
=====================

-   on VATSIM you will see the parts flag for clients supporting parts,
    e.g. vPilot and *swift*.
-   on VATSIM the GND flag for PARTS is supported, the \"other GND
    flag\" not.
-   For other servers it depends on the server settings if
    [GND]{.title-ref} and [PARTS]{.title-ref} are enabled
-   You could even enable the GND flag for an individual aircraft.
    **Never do this unless you know what you are doing!**

![image](http://img.swift-project.org/gndflag.png)

-   Leave the ground flag and fast position settings alone unless you
    know what you are doing.

Model view
==========

You can check the [GND]{.title-ref} and [PARTS]{.title-ref} in the model
view.
