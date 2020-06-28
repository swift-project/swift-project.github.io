---
title: swift developer command line arguments
---

see also `swiftcmdargs`{.interpreted-text role="ref"}

Help
====

Just use `--help` to see a help screen. You can use \"help\" with all
executables, as launcher, core and client might have different
arguments.

![image](http://img.swift-project.org/help.png)

Testing as developer
====================

Normally done like this:
`--dev --bootstrapurl https://datastore.swift-project.org/shared/`

1.  Marking as dev. provides some extra functionality
2.  The bootstrap location can also be changed to a test server

Test the dump server: `--testcrashpad`

Installers
==========

Installer cmd. line:
`-i --bootstrapurl https://datastore.swift-project.org/shared/`

1.  bootstrap URL is mandatory
2.  use installer mode [-i]{.title-ref} to launch wizard

Testing pilot client with VATSIM live servers
=============================================

::: {.note}
::: {.title}
Note
:::

Installer versions are automatically enabled for VATSIM productive keys.
:::

1.  Testing interpolation / aircraft parts

> 1.  Use swift as \"out of the box\"
> 2.  Any productive servers can be used
> 3.  Works with our without simulator attached
> 4.  Voice cannot be tested (no connection allowed)

\# Testing swift as we will ship it

> 1.  Set client id and key, cmd will look something like this:

``` {.}
```

\--serverType vatsim \--clientIdAndKey 0xFOO:BAR \--dev \--bootstrapurl
<https://datastore.swift-project.org/shared/>\`
