---
title: 'Find swift log files, crashdump files, interpolation log. files'
---

Find the log files
==================

The easiest way to find the swift log files is from the file menu:

![image](http://img.swift-project.org/swift_log_directory.png)

The path is something like here:

-   `C:\Users\JoeDoe\AppData\Local\org.swift-project`
-   Then some magic name representing your swift version, like
    `` H%3A%2FProjects%2FQtBuilds%2Fbuild-swift-Desktop_Qt_5_11_1_MSVC2017_64bit2-Debug%2Fout%2Fdebug%2Fbin\` + :code:`logs ``
-   See also: `findcachefiles`{.interpreted-text role="ref"}

On MacOS, the Path is :code:\'\~/Library/Application
Support/org.swift-project\'

![image](http://img.swift-project.org/FindLogsMacOS.png)

Find files in launcher
======================

In the launcher you can just go to [TOOLS]{.title-ref} and open the
directory there

![image](http://img.swift-project.org/launcherlog.png)

Find the crashpad (aka crash dump) files
========================================

![image](http://img.swift-project.org/crashdumpdir.png)

The crashpad files are located next to the log directory, dmp are most
useful file types. See also `crashreports`{.interpreted-text role="ref"}

![image](http://img.swift-project.org/dumps.png)

Interpolation log. files
========================

Interpolation log. files from `interpolationdisplay`{.interpreted-text
role="ref"} can also be found in the log. directory, all files for one
timestamp belong to the same session. If you want to UPLOAD those files,
zip them together in one archive.

![image](http://img.swift-project.org/interpolationlog.png)
