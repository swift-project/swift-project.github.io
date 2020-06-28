---
title: Setup data / bootstrap file
---

What is the bootstrap file?
===========================

The [bootstrap file]{.title-ref} contains fundamental setup information
for *swift*. Without those data **swift** cannot work properly. Normally
the data are loaded / updated from the internet each time *swift*
starts, in case no connection can be established at this very moment
cached data are used.

The bootstrap resolution screen
===============================

If the [bootstrap file]{.title-ref} cannot be loaded a resolution screen
is displayed. Possible reasons why `bootstrap file` loading might fail
are:

-   typo in the URL
-   *swift* servers are down (please understand we keep copies of the
    file at multiple locations)
-   network problem on user\'s side
-   if the bootstrap file has been loaded before the locally stored
    (cached) version is used
-   if the user provides an explicit URL (command line) only this URL is
    used

Options to resolve the problems \* ignore the bootstrap URL and hence
use the cached data (requires at least one successful load before that)
\* use the local file copy (from the swift installer) \* use the cache
file of another swift installation

![image](http://img.swift-project.org/Bootstrap_resolution_screen.png)
