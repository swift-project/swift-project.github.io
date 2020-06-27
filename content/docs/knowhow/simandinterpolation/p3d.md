---
title: P3D scratchpad
---

Currently collecting info about P3D

-   P3D SDK v3/2 does not come with a [simconnect.dll]{.title-ref} only
    [simconnect.lib]{.title-ref}
-   P3D still seems to distribute the FSX `simConnect` version, see
    [here](http://hifisupport.kayako.com/Knowledgebase/Article/View/6/8/instructions-for-networked-configuration-with-simconnect)
-   For P3D, the simconnect.msi is located in the P3D `REDIST` folder
    instead of `SDK` (use the XPACK/SP2 version).

![image](http://img.swift-project.org/SimConnectRedist.png)

-   For `simConnect` [network
    configuration](http://hifisupport.kayako.com/Knowledgebase/Article/View/6/8/instructions-for-networked-configuration-with-simconnect)
-   The P3D lib seems to be a VS2013 lib, and some people are creating
    their own `simconnect.dll` out of it, see
    [here](http://www.prepar3d.com/forum/viewtopic.php?t=117791),
-   The lib was made in VS2013, so you need VS2013 if you\'re trying to
    link against it. My personal approach is to create my own P3D
    SimConnect DLL from their SimConnect.h/lib (using VS2013\'s command
    line tools and a couple scripts to generate the DEF and then to
    invoke the linker) and then link to the resulting DLL (when
    appropriate) using LoadLibrary/GetProcAddress so that I can build a
    unified module (in VS2008, actually) that loads in everything from
    FSX:SP2 through P3D v3.2.
-   Creating \"an own `simconnect.dll` \" is also used by FSUIPC, see
    [here](http://board.vacc-sag.org/192/52348/page35/).
