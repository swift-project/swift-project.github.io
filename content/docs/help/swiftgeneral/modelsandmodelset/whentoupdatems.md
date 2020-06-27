---
title: 'When do I have to update my model set?'
---

\*\* Do I have to update my model set if I update my models (like
downloaded a new FLAI, BB, or X-IVAP version)? \*\* Short answer, most
likely \"yes\"

Details:

-   *swift* uses the models you have specified in the model set,
    `modelset`{.interpreted-text role="ref"}
-   If an update contains new models and you want to use those, you need
    to add them to your model set
-   If models have been deleted, you need to delete those from your set
-   It can happen new models are available but those data are not in the
    *swift* DB yet. You can help to provide those data or wait until
    those are available.
-   It is a good idea to use model validation to detect inconsistencies
    / errors in your model set, `modelsetvalidation`{.interpreted-text
    role="ref"}

Other reasons when you have to update your model set

-   you have moved or deleted a model directory
-   you have manually deleted models from your model directory

See:

`createms`{.interpreted-text role="ref"} `addtoms`{.interpreted-text
role="ref"}
