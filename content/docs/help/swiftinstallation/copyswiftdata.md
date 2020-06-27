---
title: Installing a new version in parallel and copy swift data from
  other versions
---

see also `swiftinstallation`{.interpreted-text role="ref"}

Why to install multiple *swift* versions?
=========================================

-   You want to install a 32 and 64-bit version (e.g. for FSX/P3D)
-   You want to keep a stable tested version, but test a new version
-   You want to be able to quickly change between setups. Each *swift*
    Installation has its own data/configuration

swift directory concept
=======================

-   You can install as many swift versions in parallel as you like.
    *swift* is a directory based installation, no registry entries or
    such.

-   Each installation has its own settings and cache files (and hence is
    isolated).

    > -   If you have 4 installations as above, you would also have 4
    >     setting directories with individual settings
    > -   You can always open your directories from the main menu
    >
    > ![image](http://img.swift-project.org/SettingsDir.png)
    >
    > -   For Windows: your directory is located here
    >     `C:\Users\<username>\AppData\Local\org.swift-project`
    > -   We recommend you to keep updates of your model set, as
    >     creating a model set is the most time consuming job

Installing a new version
========================

There are two ways to install a new swift version

1.  Override into the same directory

    > 1.  The same data directory is used and there is no need to copy
    >     settings or caches.
    > 2.  In case you just want to install a bug fix or such, you do not
    >     need to run the wizard if you have already setup this version
    > 3.  Remark: Some people have reported problems with overriding, in
    >     such a case just delete or uninstall swift.

2.  Installation in a new directory

    > 1.  you can keep multiple versions in parallel.
    > 2.  *swift* knows settings and caches (data files, e.g. for
    >     downloaded data). You can copy those from other swift versions
    >     after the installation.

Copy data from other swift versions
===================================

You can copy data from other swift versions via the
[launcher]{.title-ref} -\> [wizard]{.title-ref}

![image](http://img.swift-project.org/wizard.png)

-   Hint: If you have only one swift version installed, there will be no
    such wizard screen
-   Not all data files can be copied. Most likely you would want to copy
    your model set and simulator model files
-   You can copy the model set and/or model cache.
-   You can skip the copy, or just press next to get the standard files
    copied.
