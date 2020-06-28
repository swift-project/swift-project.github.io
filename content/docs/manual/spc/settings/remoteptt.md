---
title: A remote hotkey example (remote PTT)
---

Example:

-   `PCFlightSim MSI 192.x.x.137` with joystick, and *swift* core

    > -   *swift* core
    >
    > ![image](http://img.swift-project.org/soundcore.png)
    >
    > -   here I define the PTT key, on the [PCFlightSim
    >     MSI]{.title-ref}
    >
    > ![image](http://img.swift-project.org/soundcoresettings.png)

-   [LAPTOP]{.title-ref} with remote *swift* GUI

    > -   on my laptop I see that PTT key, note the hotkey comes from
    >     [PCFlightSim MSI]{.title-ref} but the screenshot is from
    >     [LAPTOP]{.title-ref}. Make sure you **really run a GUI
    >     connected to the core** -\> DBus
    >
    > ![image](http://img.swift-project.org/remotesound1.png)
    >
    > -   now when I press the joystick button on [PCFlightSim
    >     MSI]{.title-ref} (not on the laptop) I see the PTT LED \"on\",
    >     **on both machines** in the core and the GUI
    >
    > ![image](http://img.swift-project.org/remotesound2.png)
