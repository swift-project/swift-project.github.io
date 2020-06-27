---
title: Aircraft classification (model matching)
---

The standard matching for VATSIM of \"normal passenger\" plane / airline
combinations is straight forward. However, some categories are poorly
matched as there is no/little information in the current FSD concept,
like smaller utility aircraft, military aircraft, helicopters etc.

To allow model matching with more details for some aircraft categories
we will add some classification details.

::: {.important}
::: {.title}
Important
:::

Our classifications are focusing on finding the right model
representations
:::

Aircraft type
=============

1.  Unclassified, all aircraft where we **do not need** further details.
    All the normal passenger aircraft (B737s of airlines, A320s of
    airlines etc.) will be unclassified.

2.  Civil aviation aircraft (this can be used **to make clear** it is a
    freight aircraft). For some types it is clear by the ICAO code, for
    some it is not. This can be used to explicitly set it where needed.

    > 1.  Passenger
    > 2.  Freighter
    > 3.  Mixed

3.  Ultralight

    > 1.  Trike
    > 2.  Powered hang gliders
    > 3.  Powered parachutes

4.  Military combat airplanes

    > 1.  Fighter aircraft
    > 2.  Bomber
    > 3.  Multi role combat aircraft
    > 4.  Gunship
    > 5.  Glider (military glider only)

5.  Military helicopters

    > 1.  Attack helicopters
    > 2.  Transport
    > 3.  Maritime
    > 4.  Observation
    > 5.  Gunship

6.  Glider (civil glider only)

    > 1.  Touring motor gliders (something which \[\[
    >     <https://en.wikipedia.org/wiki/File:Grob.g109b.glider.arp.jpg>
    >     \| looks like a small aircraft \]\])
    >
    > 2.  Retractable propeller/turbo glider (like
    >     <https://en.wikipedia.org/wiki/File:Schleicher_ASH_26E_sailplane_1.jpg>)
    >     with their Glider competition classes:
    >
    >     > 1.  Open Class, places no restrictions except a limit of 850
    >     >     kg to the maximum all-up mass, may be one- or two-seater
    >     >     e.g. JS-1C, Lange Antares 23E, Quintus, ASH 30, ASH 31
    >     >     and LAK-20.
    >     > 2.  Standard Class, restricted to a maximum wing-span of 15
    >     >     metres and fixed wing sections (flaps or other
    >     >     lift-enhancing devices not allowed), maximum all-up mass
    >     >     525 kg, e.g. ASW 28, LS8, Discus-2, LAK-19.
    >     > 3.  15 metre Class, as Standard Class with lift-enhancing
    >     >     devices allowed, maximum all-up mass 525 kg, e.g. ASW
    >     >     27, LS6, Ventus-2, Diana 2.
    >     > 4.  18 metre Class, as the 15 metre Class with wing-spans up
    >     >     to 18 metres, maximum all-up mass 600 kg, e.g. ASG 29,
    >     >     LS10, DG-808, Ventus-2c.
    >     > 5.  20 metre Two-Seater Class, restricted to a maximum
    >     >     wing-span of 20 metres, maximum all-up mass 750 kg, e.g.
    >     >     Duo Discus, DG-1000, Arcus
    >     > 6.  Club Class, allows a wide range of older small gliders
    >     >     within a specified range of performances, e.g. Libelle,
    >     >     Standard Cirrus, LS1, Pilatus PC-11, with the scores
    >     >     being adjusted by handicapping. Disposable (i.e. water)
    >     >     ballast may be installed but must not be used in this
    >     >     class.
    >     > 7.  13.5 metre, with maximum span of 13,500mm. Disposable
    >     >     ballast allowed but maximum wing loading permitted is 35
    >     >     kg/m²
    >
    > 3.  Glider (no engine) with their Glider competition classes (see
    >     above (6.B.))
    >
    >     > 1.  Open Class, places no restrictions except a limit of 850
    >     >     kg to the maximum all-up mass, may be one- or two-seater
    >     >     e.g. JS-1C, Lange Antares 23E, Quintus, ASH 30, ASH 31
    >     >     and LAK-20.
    >     > 2.  \... same as above \....

7.  Ground vehicles (for future reference)

    > 1.  Follow me
    > 2.  Bus
    > 3.  

Aircraft details
================

Like the combined we could use a simple string representation to
classify further details

-   Number of wings, biplane `2W`, triplane `3W`:

-   Number of rotors, like `1R`, `2R`, `2RC` (coaxial), `2RT` (Tandem),
    see <https://en.wikipedia.org/wiki/Helicopter_rotor>

-   Undercarriage, mostly required to distinguish smaller `L1P` planes

    > -   Taildragger, Tri-cycle Float Monowheel, skids (like for
    >     helicopters) <https://en.wikipedia.org/wiki/Landing_gear>
    > -   not planned something like this:
    >     <https://en.wikipedia.org/wiki/Undercarriage_arrangements>

Aircraft period

Some hints in which period this aircraft belongs. Not to detailed, but
maybe something like this:

-   WWI
-   WWII
-   and so on

Q&A
===

FS: \"Doesn\'t the classification for mil. helicopters make sense for
all military aircraft?\", see
[here](https://dev.swift-project.org/T472#12476).

-   We have a military flag which allows to classify any model or ICAO
    code as \"military\"? (we keep this one)
-   This works well for a military B737/A320 where I can tell it is a
    B737/A320 used by an airforce etc. If the airforce itself has an
    official ICAO code, I can even tell which airforce it is.
-   On the other hand, in most cases there is no such information, if
    someone uses as a F15 and someone has no F15 in its model set, what
    would be a reasonable representation? At least I would like to
    display another fighter jet (if available), So displaying a Phantom
    F4 would be IMHO be better than a B737. From the ICAO information I
    can hardly distinguish those, both `L2J`.
-   I found that splitting helicopters and fixed-wing planes allow us a
    better granularity, and there are classifications which are mutual
    exclusive, but maybe we can also just merge both categories and
    distinguish fixed wing/rotorcraft by the ICAO info or the newly
    established \"details\"
