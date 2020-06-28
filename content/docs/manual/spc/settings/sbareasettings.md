---
title: SimConnect SB4 offsets settings (P3D/FSX XPDR synchronization)
---

Using the SB4 offsets
=====================

In order to synchronize your transponder (XPDR) ident and mode values
with *swift*, you need to enable the SB area (event though your client
is *swift*). Also the feature needs to be enabled by your aircraft, as
PMDG or Leonardo do.

![image](http://img.swift-project.org/SB_SimConnect_area.png)

If you want to see if you receive data from the SB4 offsets you can use.
You can see if the SB4 are is enabled and if data are received. Once
data are received `packets` is \> 0 and increasing.

![image](http://img.swift-project.org/SB4_info.png)

Testing SB4 offsets
===================

If you want to test the SB4 offsets you can send them via FSUIPC keys
for testing. Do NOT get that wrong, you do not FSUIPC for the SB4 XPDR
area, but you can use FSUIPC if you want to test *swift* SB4
integration.

![image](http://img.swift-project.org/FSUIPC_SB_offsets.png)
