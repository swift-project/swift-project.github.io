---
title: 'What is this bloody model set and why is it needed?'
---

What is the model set?
======================

The model set is a subset of all aircraft models you have installed /
stored. It represents the models you can use to display other users
(i.e. other aircraft, the other pilots). The model set is **needed for
model matching**.

::: {.important}
::: {.title}
Important
:::

No model set, no model matching, no working *swift* !
:::

See also `mm`{.interpreted-text role="ref"}

Why is *swift* using a model set, why is it needed?
===================================================

From user perspective:

-   the model set allows to define any combination of models for
    matching as you like it
-   you can mix models from various distributors
-   you can have multiple model sets suitable for special purposes
    (without installing/uninstalling models)
-   easy testing: you can easily add or remove models to your set for
    testing purposes, without having to install/uninstall the physical
    models.

Technical reasons:

-   *swift* is a multi simulator pilot client. By using a abstract model
    set (i.e. abstract from the physical models) we can use one matching
    concept for all simulators
-   *swift* can be used in distributed mode,
    `distributedswift`{.interpreted-text role="ref"} . The model set can
    be use on a remote computer without direct access (shared drive
    etc.) to your models folder.

More information
================

Find more about model set here: `smt`{.interpreted-text role="ref"}
