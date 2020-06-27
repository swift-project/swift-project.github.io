---
title: XSwiftBus/SimConnect traffic analyzed
---

swift XPlane via P2P 127.0.0.1:45001

-   setting

![image](http://img.swift-project.org/xswiftbussetting.png)

-   traffic not connected to network between XPlane/XSwiftBus

![image](http://img.swift-project.org/xswiftbustraffic1.png)

-   you can see that swift sends and XPlane receives and vice versa
-   that is about 20kByte traffic in idle mode
-   swift/XPlane talk via the loopback adaptor

![image](http://img.swift-project.org/xswiftbustraffic2.png)

swift XPlane via session bus
============================

-   this starts the DBus daemon
-   As you can see swift now talks to the Daemon and the daemon talks to
    XPlane actually doubling the loopback traffic (no network)

![image](http://img.swift-project.org/xswiftbustraffic3.png)

-   with VATSIM connected I can see something around 40kByte/s

![image](http://img.swift-project.org/xswiftbustraffic4.png)

-   again all loopback traffic

![image](http://img.swift-project.org/xswiftbustraffic5.png)

SimConnect via TCP/IP
=====================

-   swift connecting to P3D via remote TCP/IP `simConnect`
-   traffic during connecting phase of 20 aircraft, ending up with
    around 1.1 Mbit/s

![image](http://img.swift-project.org/xswiftbustraffic6.png)

![image](http://img.swift-project.org/xswiftbustraffic7.png)
