---
title: 'Why is data consolidation needed?'
---

::: {.note}
::: {.title}
Note
:::

Consolidation means your model data from the simulator will be merged
with the DB data into a more detailed data set.
:::

-   When you start the mapping tool and read the installed models the
    current DB data will be used

-   This also applies when you create the model set (the current DB data
    are used)

-   But other users (or yourself) can change the DB data at a later time
    to:

    > -   Create new mappings
    > -   Modify/correct existing mappings

-   Applying those changes requires consolidating your model data with
    the latest DB data. There are multiple ways to accomplish this

    > -   Manually via the context menu:
    >     `consolidation`{.interpreted-text role="ref"}
    > -   Automatically in background: `backupdate`{.interpreted-text
    >     role="ref"}
    > -   During the model update for the client, see
    >     `updatemodeldata`{.interpreted-text role="ref"}
