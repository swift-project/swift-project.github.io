---
title: 'Connect to an online flight simulator network (VATSIM, FSD login
  page)'
---

Before a connection to an online flight simulation network is made,
several configuration parameters need to be set. Most of them will
already be pre-filled and do not need to be touched. Only very few
parameters need a one off configuration. The following two sections
explain how to connect to VATSIM or any other private FSD network.

Generally all changes you make are automatically saved and restored next
time you launch the application.

1. Network Configuration
========================

![image](http://img.swift-project.org/network1.png)

**Server Selection:** In order to connect to a VATSIM server, make sure
to select the `VATSIM` tab. The combobox shows a list of active VATSIM
servers. This list is updated automatically on a regular basis. Select
the server of your choice. The selection is saved while connecting.

In order to connect to another custom FSD server, change to
`Other servers` tab and select the server from the combobox. By default,
swift does not offer any preconfigured custom FSD server. Go to
`Settings->Servers` or use the shortcut button `goto settings` to add
and edit custom servers. One typical scenario for a custom FSD
connection would be to connect to Euroscope to setup a Tower View. See
`towerview`{.interpreted-text role="ref"} for more details.

**Mode Selection** As a regular pilot, you want to use `Normal`
connection mode. The second mode is offered for shared cockpit users,
further details `sharedcockpit`{.interpreted-text role="ref"} .

**FSD Details** The default values are fine for regular usage. See
advanced section for more information.

**Voice** The default values are fine for regular usage. See advanced
section for more information.

**Matching log** The default values are fine for regular usage. See
advanced section and `matchmsg`{.interpreted-text role="ref"} for more
information.

2. Pilots Info
==============

![image](http://img.swift-project.org/network2.png)

This section requires you to enter your CID, password, real name and
home base. Use the binoculars to get a helper dialog to select the
airport ICAO code or just type it into the field - a completer will help
you.

=== 3. Own aircraft ===

![image](http://img.swift-project.org/network3.png)

This section configures the details of your used aircraft. If a
simulator is connected already and the used aircraft model was known to
swift (the Model name has a green border), then all parameters are
expected to be filled correctly. Use the blue circle to refresh it, if
the model name does not seem to be correct. Also correct any wrong
items.

::: {.important}
::: {.title}
Important
:::

Having a mapping of the \"own\" (i.e. the flown) aircraft in the
database is a CONVENIENCE feature. You can always manually set the ICAO
code for aircraft/airline in the login screen.
:::

-   Red: Aircraft information missing, simulator not connected If your
    simulator is connected, but the model not picked up, use the reload
    button next to the \"red box\".

![image](http://img.swift-project.org/redbox.png)

-   Yellow: This aircraft can be used, but it is not know in the DB yet.
    You need to fill in the aircraft data manually

![image](http://img.swift-project.org/yellowbox.png)

-   Green: Model known in DB, all filled in automatically

![image](http://img.swift-project.org/greenbox.png)

**Finally enter your selected callsign.**. If you need help here, see
`choosecs`{.interpreted-text role="ref"} .

4. Advanced Settings, FSD Details
=================================

![image](http://img.swift-project.org/FSDSetup2.png)

Different flight simulator networks offer different features. Those can
be enabled and disabled for this specific network.

**Parts**

Aircraft parts are a VATSIM specific extension of the FSD protocol to
synchronize aircraft parts (gear, flaps, engines, lights, etc.). Using
the extension on other private FSD networks other than VATSIM might
work. Consult the network responsible in case of doubts.

**Gnd.Flag**

This flag configures whether the ground flag is sent as part of a pilot
position update. On VATSIM, this is not the case. IVAO and other FSD
networks make use of it.

**Fast pos.**

A flag that controls whether fast position updates are in use in this
FSD network. This generally works only between swift clients.

**Text codec**

FSD protocol is pure ASCII. Most FSD networks do not define which
minimum string encoding is supported by the server and clients. If
another string encoding is required, it can be changed here.

**Voice**

![image](http://img.swift-project.org/udpport.png)

VATSIM only: This setting allows to change the default VATSIM Voice UDP
port, in case the default port is already in use or the user would like
to change it.

**Matching log**

The two check boxes enable or disable the creation of matching logs.
Those are helpful to understand why a particular remote aircraft is
displayed (as for example [A320 DLH]{.title-ref}). The matching log is a
very verbose trace of what information was available which decisions
have been taken to select the visible aircraft model. See
`matchmsg`{.interpreted-text role="ref"} .

5. Advanced login popup
=======================

In order to set a partner callsign and/or modify the send network data
you can use the advanced login popup, see
`advloginscreen`{.interpreted-text role="ref"} .
