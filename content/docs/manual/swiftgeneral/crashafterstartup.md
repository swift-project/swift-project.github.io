---
title: swift crash after startup
---

::: {.important}
::: {.title}
Important
:::

It is a good idea to enable crash dumps,
`crashreports`{.interpreted-text role="ref"}
:::

Joystick
========

We have had cases where loading joystick data caused *swift* to crash.
Reason unknown so far. Solution: Try to unplug the joystick and see if
it works now

Window locations
================

Changes in your UI setup (new graphics card) can cause the stored
windows sizes etc. being invalid. Delete those data as described here:
`resetscreen`{.interpreted-text role="ref"} .
