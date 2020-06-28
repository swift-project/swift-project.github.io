---
title: 'Model set - creating or recreate a model set'
---

Which models to use?
====================

This is up to you, but maybe some hints:

-   For XPlane:

    > -   BlueBell is a good option, see
    >     `examplemsbbxcsl`{.interpreted-text role="ref"}
    > -   You can mix BlueBell with XCSL, use it alone, use BlueBell
    >     alone etc.

-   For VATSIM and FSX/P3D FLAI is a good choice

    > -   For instance start with FLAI and the standard FSX/P3D models

-   For Flightgear:

    > -   Models within \"FGDATA/AI/Aircraft\" can be used.

Some general tips:

-   Do not simply add a huge bunch of models to your set, choose wisely
-   Add the default simulator models (if applicable) as models so they
    can be used if no other model is found
-   Start with one additional model library on top of that
-   Gradually add for specialized models as needed.

Installed models vs. model set
==============================

If you do not understand the difference (i.e. what a model set is), see
`mm`{.interpreted-text role="ref"} .

Creating a model set or recreate model set
==========================================

::: {.warning}
::: {.title}
Warning
:::

It is the users responsibility to check if he is entitled to use the
models in the set for online flights with a particular network. swift is
an open source client for multiple networks, but this does not mean you
are allowed to use it with all the networks.
:::

-   In the mapping tool, go to the \"Own models\" tab. The models here
    depend on your model directories, see
    `modelsetandsettings`{.interpreted-text role="ref"}

![image](http://img.swift-project.org/swift_mapping_tool_-_own_models.png)

-   If you need to **reload your models** you can use the [FORCE
    RELOAD]{.title-ref} context menu.

![image](http://img.swift-project.org/forcereload.png)

-   You can add to your model set via the context menu.

![image](http://img.swift-project.org/swift_mapping_tool_-_add_to_model_set.png)

-   If you want to clear/re-create your model set: go to the model set
    where can delete your models by `CTRL+A` then `DEL` (as one of many
    possibilities).
-   If possible, only use models with DB mapping (see DB icon)
-   You can filter the models, and then add all filtered models

![image](http://img.swift-project.org/swift_mapping_tool_-_filter_models.png)

-   Excluded models are normally not used with a model set, see
    `excludedmodels`{.interpreted-text role="ref"} . As you can see
    here, the excluded model is ignore when adding to the model set:

![image](http://img.swift-project.org/Add_excluded_models.png)

![image](http://img.swift-project.org/Add_excluded_models_result.png)

-   Advanced topics:

    > -   `modelsetduplicates`{.interpreted-text role="ref"}
    > -   `rankmodelset`{.interpreted-text role="ref"}

-   

    Do not forget to save your model set

    :   -   You can have as many sets as you like
        -   Each set needs to be saved
        -   Each simulator has its own set

Model set rules
===============

-   Do not add models to a set which do not work or really exist
-   If you install new models you need to update your model set and add
    the new models you want to use
-   If you uninstall a model you need to remove it from the set, see
    `modelsetvalidation`{.interpreted-text role="ref"}
-   If you move your models around (i.e. change the model folder) you
    need to recreate the set to provide the new location.

Check the model set in the client
=================================

You can load the model set in the client to see if you have model set.
If this view is empty AFTER you have pressed \"LOAD MODEL SET\" then
something is wrong. Especially if you are using the distributed *swift*
version (i.e. core and distributed GUI) this is a good check.

You can also validate from there: `modelsetvalidation`{.interpreted-text
role="ref"} .

![image](http://img.swift-project.org/modelsswiftgui.png)

Examples and tutorials
======================

-   See also `smttutorials`{.interpreted-text role="ref"}
-   `examplemsbbxcsl`{.interpreted-text role="ref"}

Sorting and cleaning a model set
================================

-   `rankmodelset`{.interpreted-text role="ref"} and
-   `modelsetduplicates`{.interpreted-text role="ref"}
-   `modelsetvalidation`{.interpreted-text role="ref"}

Keep you data up to data
========================

See `consolidation`{.interpreted-text role="ref"}

Multiple model sets

See `maintainmultiplemodelsets`{.interpreted-text role="ref"}
