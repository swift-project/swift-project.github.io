---
title: No sound on macOS (loopback not working)
---

Make sure you have the MIC (microphone) enabled for *swift*.

![image](http://img.swift-project.org/macsound.png)

-   There is a bug currently being investigated.
-   MacOSX seems to be very picky about app bundle info.plist. No matter
    what we add to it, it just won't work without any warning.
-   Workaround: Open the swiftguistd application bundle content and drag
    the internal binary into console. That should work

![image](http://img.swift-project.org/workaround_mac1.png)

![image](http://img.swift-project.org/workaround_mac2.png)

![image](http://img.swift-project.org/workaround_mac3.png)
