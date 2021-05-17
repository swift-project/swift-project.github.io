---
title: 'Tower view for controllers with EuroScope, vStars'
---

Using Swift as Tower View with Euroscope ATC Client
===================================================

Using X-Plane 11 (XP11) or Prepar3D v4.x (P3D)):

-   `Start` **Euroscope** at the airport of your choice. It is not
    necessary to start Euroscope\'s Proxy Server.

-   `Connect` Euroscope to VATSIM.

-   `Start` X-Plane 11 or P3D at an airport of your choice

    > -   For **X-Plane 11**, use any aircraft (e.g. C172) on a remote
    >     stand. Once started, select Tower (shift+5) or Free Camera
    >     (c).
    > -   For **P3D**, select \'Tower Controller\' from the main startup
    >     page/Location/Starting Location (bottom of list).

-   `Start` the *swiftGUI*

    > -   Under **Settings =\> Servers**, create a server for localhost
    >     by filling in a suitable name (e.g.) \'Tower View\' and a
    >     description (e.g. \'Local Tower View\').
    > -   As **address** use \'localhost\' or the IP-address of the
    >     computer that runs Euroscope, set **port** 6809.
    > -   Set **Eco.** to \'VATSIM\' and **type** to \'FSD \[VATSIM\]\'.
    > -   Fill in anything in the boxes for **real name**, **ID** and
    >     **password** (none of them are used for a proxy connection,
    >     but the boxes cannot be empty).
    >
    > ![image](http://img.swift-project.org/TowerView_ServerSetup.jpg)

-   Click on the *swift* **Connect widget**. On top you will find the
    **Network** options, there select the **Other Servers** tab (do not
    use VATSIM tab) and then the Tower Server that you just created.

![image](http://img.swift-project.org/TowerView_SelectServer.jpg)

-   The information in the **Own aircraft** section do not matter, you
    can fill in any bogus data.

![image](http://img.swift-project.org/ownaircraft.png)

-   Click on [Connect]{.title-ref}. Live VATSIM aircraft will appear in
    X-Plane 11/P3D after several seconds, your *swift* Aircraft and
    Models pages will be populated, too.

vSTARS
======

1.  Open SwiftGUI

2.  Select \"Settings\"

3.  Select \"Servers\"

4.  Fill in, for the server descriptions\...

    > 1.  Name: Localhost
    > 2.  Description: Tower View
    > 3.  Eco./type VATSIM then FSD\[VATSIM\]
    > 4.  Addr./port: localhost then 6809
    > 5.  Leave the rest blank

5.  Select \"save\"

6.  Run vSTARS and connect

7.  Run `.startproxy` in vSTARS

8.  In SwiftGUI, select \"Connect\"

9.  Select \"Other servers\"

10. Select \"Localhost: Tower View\" from the dropdown

11. Select \"connect\"

Remark: \"The one tricky thing is if your doing it on separate computers
you have to put in the computer that owns the proxy as the IP address
and start the proxy before connecting\"

Impressions
===========

**Tower view impressions (X-Plane 11)**

Euroscope with vSMR plugin

![image](http://img.swift-project.org/towerview.png)

Traffic situation on the radar as seen in X-Plane 11

![image](http://img.swift-project.org/towerview2.png)

![image](http://img.swift-project.org/towerview3.png)
