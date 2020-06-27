---
title: Tracing and testing aircraft parts
---

To trace aircraft parts you have multiple options:

-   Use the interpolation \"parts\" tab, there you can monitor aircraft
    parts.

![image](http://img.swift-project.org/Interpolation_parts_log.png)

-   Use the internals page. You can override the values by using the
    [send]{.title-ref} functions. You can \"fake\" received parts by
    just setting the GUI values and \"Send GUI\". This generates a
    packet like it was received from another swift client.

![image](http://img.swift-project.org/Aircraft_parts_internals.png)

-   You can also use the `interpolationdisplay`{.interpreted-text
    role="ref"}
-   or if you just want to test offline `modelbrowser`{.interpreted-text
    role="ref"}
-   See also `interpolationexamples`{.interpreted-text role="ref"}
