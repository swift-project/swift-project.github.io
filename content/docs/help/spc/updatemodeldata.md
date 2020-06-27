---
title: Update model data (for the client)
---

Read also: `dataprovisioning`{.interpreted-text role="ref"}

When new model data (more precisely \"shared data\", a copy of the DB
data) are published, you will see an update screen in the pilot client.
Those data include airline data, model data, new liveries etc. New data
will be published if new mappings (`mm`{.interpreted-text role="ref"} )
are created, data are corrected, new airlines are added. **It will NOT
update the program, only data**.

This update will do two things.

-   download the latest model data (ICAO codes, models, liveries \....)
-   consolidate the data, see `whydataconsolidation`{.interpreted-text
    role="ref"} . This means your model set data are updated.

::: {.note}
::: {.title}
Note
:::

This step can take a while to complete as all the data will be
downloaded and merged (consolidated) with your simulator models.
Normally you can just run the update without doing anything.
:::

![image](http://img.swift-project.org/client_model_update.png)

![image](http://img.swift-project.org/client_update_consolidation.png)

Remark: When you run the mapping tool the latest DB data will be
automatically downloaded, so in that case you already have the latest
data .
