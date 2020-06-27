---
title: Aircraft position data (from simulator and network)
---

See also `simalts`{.interpreted-text role="ref"}

[P3D](http://www.prepar3d.com/SDKv3/LearningCenter/utilities/variables/simulation_variables.html) and [FSX](https://msdn.microsoft.com/en-us/library/cc526981.aspx)
===================================================================================================================================================================

-   Altitude values own aircraft: `PLANE ALTITUDE`,
    `PLANE ALT ABOVE GROUND`, `STATIC CG TO GROUND`, `GROUND ALTITUDE`

    > -   Example: aircraft in EDRY 312ft ELV

  ---------------------------------------------------------------
                        C172                 B737
  --------------------- -------------------- --------------------
  altitude              315.72497011731951   321.66457557565963

  altitudeAboveGround   3.7254348326937929   9.6653964302668669

  cgToGround            3.7650001049041748   9.6700000762939453

  elevation             311.99953528462572   311.99917914539276
  ---------------------------------------------------------------

-   Altitude values queried for remote aircraft: `PLANE ALTITUDE`,
    `STATIC CG TO GROUND`, `GROUND ALTITUDE`
-   Position values for remote aircraft
    [SIMCONNECT\_DATA\_INITPOSITION](https://msdn.microsoft.com/en-us/library/cc526983.aspx#SIMCONNECT_DATA_INITPOSITION).

[X-Plane](http://www.xsquawkbox.net/xpsdk/docs/DataRefs.html)
=============================================================

-   Own aircraft example: aircraft at KSEA rwy 16L (432.5ft / 131.826m
    ELV)

  ----------------------------------------------------------
                                       C172       B744
  ------------------------------------ ---------- ----------
  sim/flightmodel/position/elevation   133.3706   136.9491

  sim/flightmodel/position/y\_agl      0.0694     0.2349

  sim/aircraft/gear/acf\_h\_eqlbm      2.9933     4.7176
  ----------------------------------------------------------

See also
========

-   `ongroundscenarios`{.interpreted-text role="ref"}
