---
title: 'Models, model set and settings - how does it fit together?'
---

If you want to use a model for model matching (`mm`{.interpreted-text
role="ref"} ) you need to add it to the model set. Only models in the
model set will be used for model matching. If you install/uninstall
models on your disk you might need to update your model set
(`whentoupdatems`{.interpreted-text role="ref"} ).

1) How does *swift* know where my models are installed?
=======================================================

If you do NOT know where to place (install) your models, see
`xpmodeldirectories`{.interpreted-text role="ref"} . You can change the
simulator directories as described here:
`modeldirectories`{.interpreted-text role="ref"} . Please understand
that changing these settings values does not automatically change your
model set!

::: {.important}
::: {.title}
Important
:::

XPlane CSL models have to be inside the XPlane folder structure
:::

2) What are the model directories are used for? The model list!
===============================================================

Depending on the model directories you can create **a list of all your
models installed**, this can be done

-   in the wizard here

    > -   the model list here you can display via display
    > -   the models here **are NOT the model** set, the model set is a
    >     subset of those models you want to use for matching
    > -   the list here is the SAME list as in the mapping tool

-   or the mapping tool, see `createms`{.interpreted-text role="ref"}

3) The model set
================

The model set is a list of those models you want to use for matching:
`matching`{.interpreted-text role="ref"} .

-   you can create your model set in the wizard by selecting the
    distributors list

    > -   this picks those models from your model list (see above) and
    >     adds it to the model set
    > -   in this step we do not care about the simulator settings, only
    >     the list generated is considered

-   the model set can also be generated in the mapping tool

    > -   you can do much more things in the mapping tool, e.g.
    >     arbitrarily mixing models from distributors, see
    >     `examplemsbbxcsl`{.interpreted-text role="ref"}
    > -   Here is shown how to update or re-create your model set, see
    >     `addtoms`{.interpreted-text role="ref"} and
    >     `createms`{.interpreted-text role="ref"}

-   Hint:: If you use models of multiple providers in your set, we
    recommend to remove duplicates, see
    `modelsetduplicates`{.interpreted-text role="ref"} and
    `examplemsbbxcsl`{.interpreted-text role="ref"} .

4)  Why do we need all this?

`modelset`{.interpreted-text role="ref"}
