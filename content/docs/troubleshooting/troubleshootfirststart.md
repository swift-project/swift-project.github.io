---
title: Troubleshooting installation and 1st start
---

**1) All simulators, OS**

**Checklist**

Read this [checklist]({{< ref "useswiftchecklist" >}})

**Setup / bootstrap file trouble**

See [Bootstrap file]({{< ref "bootstrapfile" >}}).

***swift* does not start / connect**

- Could be a Virus scanner/Security suite issue, maybe check if swift needs some permission there
- Firewall, ports open \....
- if you see something like
    - `"ASSERT failure in QList <T>::operator "index out of range", file C:\QT\5.12.0\msvc2017_64\include\ Qtcore/qlist.h,line 552"`    
    your settings could be corrupt, [see here]({{< ref "resetscreen" >}})
- sometimes it can help to uncheck and check again the simulator again (simulator settings)

**swift hangs after start**

- could be that the screen geometry values are incorrect, see [Reset the screen size]({{< ref "resetscreen" >}})
- or even [Delete swift registry values (Windows only)]({{< ref "registrydelete" >}})
- also we had people having issues with
    - malware protection
    - recently some reports with TrueImage Active protection came up (that blocking swift)

**Validation errors**

See [Why do I see validation errors during startup?]({{< ref "whyvalidationerrors" >}})

**No Mic / cannot talk to controller**

-   [Troubleshoot voice (no ATC, no MIC, no sound, sample rates, WASAPI)]({{< ref "troubleshootvoice" >}})
-   MacOS user? See [here]({{< ref "macosnosound" >}})
-   Windows: [Microphone not working on Windows]({{< ref "nomiconwindows" >}})

**The Qt WIFI problem**

If you see messages like `No network access point` or `No network` and **you are using WIFI** then you likely suffer from a Qt bug. In some versions the Qt framework (the library *swift* uses) is broken. Qt has promised to fix that. However, you can try the following workaround. In your *swift* installation directory you will see a directory `bearer`, just remove this directory and try again.

**2) Simulator specific**

**P3D/FSX specific**

-   I only see \"Constellations\". Most likely you have no model set, an
    improper model set, see `createms`{.interpreted-text role="ref"}
-   If the simulator does NOT connect, see
    `configuresim`{.interpreted-text role="ref"}
-   make sure you have the correct *swift* version,
    `32bitor64bitinstaller`{.interpreted-text role="ref"}
-   If you cannot connect the simulator and *swift*: If you run P3D \"as
    admin\", run swift \"as admin\"
-   make sure you use the correct P3D driver version. If this version
    does not (yet) exists, selected the version which comes closest.

![image](http://img.swift-project.org/driver.png)

X-Plane specific
================

-   

    Warn of XSquawkBox/xPilot conflict

    :   -   *XSwiftBus* doesn\'t work properly if xsquawkbox or x-ivap
            is also installed since only one can have control of X-Plane
            multiplayer aircraft. *swift* will raise a warning in case
            another plugin is controlling the multiplayer aircraft.
        -   Remove or disable the conflicting plugin and restart
            X-Plane. Plugins are still loaded even if they are disabled.
            Disabled just means that any callbacks registered by the
            plugin will not be called. Some people have to remove the
            plugins from the folder, some do not.
        -   Maybe you consider a 3rd party tool like
            `xorganizer`{.interpreted-text role="ref"}

-   **Bluebell CSL models sunken in ground** (vertical offset fix) , see
    `xplanecg`{.interpreted-text role="ref"}

-   XPlane models in model set, **but not rendered**. **Solution**: CSL
    files need to be inside the `XPlane` folder. Moving the XPlane
    models might require to reload your swift model cache, then
    recreating the model set.

-   *swift* cannot connect to XPlane simulator side plugin:

    > -   Check if the settings of the *swift* side and XPlane side do
    >     match, `xswiftbussettings`{.interpreted-text role="ref"} .
    > -   If the simulator LED is \"on\" the simulator can be connected:
    >
    > ![image](http://img.swift-project.org/swift_LED_bar.png)
    >
    > -   XPlane not connecting with *swift* on MacOS, see
    >     `noconnectonmac`{.interpreted-text role="ref"} .

-   **HINT:** Some users did have problems with spaces in their model
    directory paths

-   **Aircraft animation** as gear down **not working**:

    > -   There are some known conflicts with other XPlane add-ons as
    >     those keep common multiplayer animation [datarefs]{.title-ref}
    >     (being shared between all pilot clients) locked and the
    >     *swift* dataref registration fails.
    > -   In order to resolve the problem move the conflicting plugin
    >     out of your plugin folder and restart. The conflict is known
    >     to cause trouble with gear animations and such.
    > -   Problems with the following plugins have been reported: all
    >     other client plugins like XSB, x-ivap, fscloud, fs2play

**FS9 specific**

-   FS9 needs two connections: `DirectPlay` Multiplayer and `FSUIPC`
    since DP MP doesn\'t have all required details

    > -   `DirectPlay` is auto connected if swift runs on the same
    >     machine and has been properly installed (adding itself as
    >     \"lobby-able\" application on windows registry)
    > -   See `fs9mp`{.interpreted-text role="ref"}

-   When you run FS9 as admin, then `FSUIPC` isn\'t connecting, because
    *swift* running as non admin blocks the connection. Run both as
    admin.

-   Some people have have reported issues with models not from the
    `aircraft` folder of FS9

-   some users have problems with the auto-connect to FS9 since Win10
    1909 update, see `fs9mp`{.interpreted-text role="ref"}

-   `fs9elevation`{.interpreted-text role="ref"}

**3) OS specific**

**Some issues with Mac OS**

-   XPlane not connecting with *swift* on MacOS, see
    `noconnectonmac`{.interpreted-text role="ref"}.
-   Not validated: Installation in `Application` failt, but in XPlane
    directory it works.

::: {.toctree glob="" caption="Content in this chapter"}
./\*
:::
