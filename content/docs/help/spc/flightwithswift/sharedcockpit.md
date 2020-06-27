---
title: 'swift in a shared cockpit (co-pilot observer OBS mode)'
---

![image](http://img.swift-project.org/Login1st_pilot.png)

![image](http://img.swift-project.org/Login_2nd_pilot.png)

swift can be used in a shared cockpit scenario, with one pilot flying as
co-pilot

-   the primary pilot will fly with the normal callsign in `NORMAL` mode
-   the secondary pilot needs to **add an extra character to the
    callsign** and will use the `OBS` mode

Explanation:

-   the 1st pilot will be shown as normal for everyone.
-   using the `OBS` prevents the 2nd pilot (co-pilot) to be shown.
-   the callsign hack prevents the primary pilot to be shown in the
    co-pilot\'s simulator.

Remark: another way to disable a particular aircraft from being shown in
*swift* is to disable it in the model view (context menu). This should
not be required if the callsign is correct.

Partner callsign
================

You can add a partner callsign to receive text message for your
co-/pilot. See `advloginscreen`{.interpreted-text role="ref"} .

Troubleshooting
===============

If you see your \"co-pilot\" following your plane then most likely the 2
callsigns are NOT set as described above.
