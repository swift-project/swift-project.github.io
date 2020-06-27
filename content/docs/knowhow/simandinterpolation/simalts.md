---
title: Simulator altitudes
---

swift uses 4 altitude related values

-   Elevation (scenery elevation)
-   Scenery altitude, aka true altitude
-   Scenery AGL, altitude above ground
-   Pressure altitude
-   see also `altitude`{.interpreted-text role="ref"}

FSX/P3D
=======

SimConnect variables
<http://msdn.microsoft.com/en-us/library/cc526981.aspx> SimConnect
events <http://msdn.microsoft.com/en-us/library/cc526980.aspx> P3D vars
<http://www.prepar3d.com/SDKv3/LearningCenter/utilities/variables/simulation_variables.html>

-   `SimConnect_AddToDataDefinition(hSimConnect, CSimConnectDefinitions::DataOwnAircraft, "PLANE ALTITUDE", "Feet")`
-   `SimConnect_AddToDataDefinition(hSimConnect, CSimConnectDefinitions::DataOwnAircraft, "PLANE ALT ABOVE GROUND", "Feet")`
-   `SimConnect_AddToDataDefinition(hSimConnect, CSimConnectDefinitions::DataOwnAircraft, "PRESSURE ALTITUDE", "Meters")`
-   `SimConnect_AddToDataDefinition(hSimConnect, CSimConnectDefinitions::DataOwnAircraft, "GROUND VELOCITY", "Knots")`
-   `SimConnect_AddToDataDefinition(hSimConnect, CSimConnectDefinitions::DataOwnAircraft, "GROUND ALTITUDE", "Feet")`
-   `SimConnect_AddToDataDefinition(hSimConnect, CSimConnectDefinitions::DataOwnAircraft, "SIM ON GROUND", "Bool")`

Although documentation says the indicated altitude is send as pressure
altitude, changing the QNH (altimeter know) does **not** have any
effect. Also failures have no effect.

QNG: Hg 29,92 (1013,20mbar)

![image](http://img.swift-project.org/Pressure_alt_QNH_changed_1.png)

![image](http://img.swift-project.org/Pressure_alt_QNH_changed_2.png)

![image](http://img.swift-project.org/p3dfailures.png)

Changing weather to thunderstorms, Hg 29,21 (989,2mbar) Pressure
altitude changes from 320 to 1026ft

![image](http://img.swift-project.org/altitude.png)

FSUIPC
======

-   Ground altitude:
    `FSUIPC_Read(0x0020, 4, &groundAltitudeRaw,   &dwResult)`
-   Altitude: `FSUIPC_Read(0x0570, 8, &altitudeRaw, &dwResult)`
-   Pressure altitude:
    `FSUIPC_Read(0x34B0, 8, &pressureAltitudeRaw, &dwResult)`

Flightgear - True altitude from FG property `/position/altitude-ft` -
Pressure altitude from FG property
`/instrumentation/altimeter/pressure-alt-ft`. When
`/instrumentation/altimeter/servicable == false`, as fallback the true
altitude `/position/altitude-ft` is send.
