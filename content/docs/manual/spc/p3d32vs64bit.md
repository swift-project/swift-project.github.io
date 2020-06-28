---
title: 'P3D and swift - 32 or 64 bit?'
---

The ideal choice for using P3D with swift is the 64bit version. However,
for P3D before V4.2 you need to use the 32bit version. You can try the
64bit version, but likely the driver will not connect.

You can also use the 32bit version with the newer P3D versions, but then
always the legacy FSX driver will be used. (as you can see in the
screenshot).

![image](http://img.swift-project.org/P3D_with_swift_x86.png)

-   The swift x64 {64bit} version uses the latest P3D SimConnect API and
    library
-   The swift x86 (32bit) version uses the FSX SimConnect API and
    [dll]{.title-ref}

Hint: use the correct P3D version or use the one comes closest.

![image](http://img.swift-project.org/p3dversion.png)

Why would I want to use the P3D x64 version?
============================================

-   First of all, because you can use a x64 version not having the
    memory restrictions of a x86 version. But that does not really
    matter for normal users. So if you use P3D and FSX and you only want
    to use the x86/32bit version you are fine (time will tell if this
    remains true).
-   Also, because in the mid and long term the new `SimConnect` uses
    newer P3D API functions not available in legacy `SimConnect`. So far
    the difference between old and new API is minor, but steadily
    increasing. As of 4.2 we already use newer functions, and we also
    will use even better ones available in 4.3 and later.
