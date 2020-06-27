---
title: swift JSON formats
---

`CFlightPlan` directly
======================

``` {.}
{
    "aircraftIcao": {
        "combinedType": "L2J",
        "dbKey": 5631,
        "designator": "F22",
...
    },
    "route": "",
    "takeoffTimeActual": "",
    "takeoffTimePlanned": "Di Nov 13 23:47:00 2018 GMT",
    "timestampMSecsSinceEpoch": -1
}
```

[CVariant]{.title-ref} format
=============================

``` {.}
{
    "type": "BlackMisc::Aviation::CFlightPlan",
    "value": {
        "aircraftIcao": {
            "combinedType": "L2J",
            "voiceCapabilities": {
                "voiceCapabilities": 2
            }
        },
        "route": "",
        "takeoffTimeActual": "",
        "takeoffTimePlanned": "Mo Nov 12 23:47:00 2018 GMT",
        "timestampMSecsSinceEpoch": -1
    }
}
```

Cache format
============

``` {.}
{
    "lastserver": {
        "type": "BlackMisc::Network::CServer",
        "value": {
            "address": "fsd.swift-project.org",
            "description": "Client project testserver",
...
        }
    }
}
```

=== Container format ===

tbw.
