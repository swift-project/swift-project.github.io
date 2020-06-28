---
title: 'Why do I see validation errors during startup?'
---

If validation errors are shown during your pilot client startup, this
means swift detects that something is wrong with your model set. See
also `modelsetvalidation`{.interpreted-text role="ref"} and
`modelsetvalidation`{.interpreted-text role="ref"} .

Single validation errors (a few models only)
============================================

This means a single model is \"broken\", maybe malfunctioning: There is
no general advice, this needs to be investigated case by case. A simple
solution would be to remove the model from the model set.

![image](http://img.swift-project.org/removefrommodelset.png)

You do **NOT** have to uninstall the model, removing from the model set
is enough (remove and SAVE).

Multiple validation errors
==========================

Multiple validation errors mean something is generally wrong. Most
likely the file path for the model is not correct. That can mean:

-   you have moved your model directory and not updated your model set,
    solution `createms`{.interpreted-text role="ref"}
-   Is your XPlane model directory within the XPlane directory?
-   For XPlane it might me that you made a mistake during the
    installation of the vertical offsets and ended up with cascaded
    directories, see `xplanecg`{.interpreted-text role="ref"} . Fix the
    offsets, then re-create your model set `createms`{.interpreted-text
    role="ref"}
-   For FSX/P3D: It can be that there is a mismatch with the
    `Simobjects.cfg`, `Add-ons.cfg` and `Add-On-xml` files

::: {.important}
::: {.title}
Important
:::

Check the validation messages, not only the `INVALID MODELS` - there
might be further information.
:::
