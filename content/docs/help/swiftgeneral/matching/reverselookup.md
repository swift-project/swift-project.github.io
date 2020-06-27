---
title: Reverse lookup
---

Reverse lookup means we use the mapping data (aka \"mappings\") to
conclude from a model to ICAO data or. liveries. Normally we use ICAO
data and livery information to find a model (this is called \"model
matching\", see also `mm`{.interpreted-text role="ref"} ).

In reverse lookup we use the model string

-   to fill in the flight plan
-   fill in the login ICAO data

and send it to other *swift* clients, the other *swift* will lookup the
correct ICAO and livery information from that model as those are more
detailed and accurate

-   as we can distinguish liveries, and not just airlines
-   and also can distinguish virtual from real airlines,
-   furthermore we can also use the color information for GA aircraft
