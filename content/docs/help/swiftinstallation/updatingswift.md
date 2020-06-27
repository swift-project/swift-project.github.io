---
title: Updating swift
---

Updating by \"overwriting\" a current installation (e.g 0.9.1.1234 =\>
0.9.1.1235)

-   this is the easiest way to install a *swift* version
-   you just select the same directory as your previous version
-   all *swift* files will be copied over the \"old\" ones
-   you will **NOT** override your settings and model set, **the same
    settings/models as before will be used**
-   we recommend to **override within a 3 digit branch only**, so
    0.8.9.xxxx by 0.8.9.yyyy.
-   otherwise we recommend to install the new version parallel to the
    old one. By that you can always fallback to the old version if you
    need to.
-   we recommend to keep testing versions parallel to your latest stable
    version (whatever stable means to you)
-   **Do NOT forget** to copy the new //XSwiftBus// version if
    applicable. Either in the wizard or manually

Always overriding
=================

If you always want to override, just install swift in a directory
without version number, or with a 1 digit version number only, (e.g.
`foodir/swith_0.9`). But you need to understand:

1.  by that your old version is gone when you update
2.  your old setup will be used,
3.  but if the new version, is broken, there is no way back.

Parallel installation and copy settings/models (e.g 0.9.1 =\> 0.9.2)

-   If you have a stable version for online flying, keep this until you
    have tested the new version
-   you would install swift in a new directory, this is literally a new
    installation
-   then you would copy your models/settings from another *swift*
    version via the launcher
-   this is covered in `copyswiftdata`{.interpreted-text role="ref"}

::: {.important}
::: {.title}
Important
:::

Many people mistakenly start a wrong version with multiple
installations, so if you no longer need another version consider
uninstalling it
:::
