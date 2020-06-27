---
title: Build on Windows
---

**Download prerequisites**

1.  **\`Git \<http://git-scm.com/download/win\>\`\_**
2.  **\`Visual Studio Community 2019
    \<https://www.visualstudio.com/\>\`\_** (be sure to select C++
    during installation)
3.  **\`Qt 5 \<https://www.qt.io/download-qt-installer\>\`\_**

**Clone the git repo**

``` {.}
git clone ssh://git@dev.swift-project.org/source/pilotclient.git
git submodule update --init
```

::: {.important}
::: {.title}
Important
:::

As a developer you would normally wish to clone the latest
[develop]{.title-ref} branch
:::

**Compile**

importantIt might be a good idea to exclude the build directory from
your virus scanner, as otherwise new executable will not work properly

**With Qt Creator**

Actually you should be able to directly open the cloned repo as project
in QtC. Setup your Qt kit and then it should compile.

-   After that you should be able to start your *swift* applications.
    Maybe you have to start QtC after the very first compilation to see
    that context menu.

![image](http://img.swift-project.org/qtc5.png)

-   If you change the branch or you pull a new swift version consider
    running `qmake` from the QtC again, sometimes new files are not
    recognized otherwise.

**With `qmake` and Visual C++ IDE**

``` {.}
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
qmake -tp vc -Wlogic -spec win32-msvc -r C:\path\to\swift\swift.pro
```

::: {.note}
::: {.title}
Note
:::

{icon file-text-o} P4 Use this script to automate the procedure of
running qmake. It will prompt you to choose which of your installed
versions of Qt and VS to use, and whether to build for 32 or 64 bits.
:::

**With `qmake` and MinGW**

``` {.}
qmake -Wlogic -spec win32-g++ -r C:\path\to\swift\swift.pro
mingw32-make
```

**With Clang**

See `clang`{.interpreted-text role="ref"} .

::: {.toctree caption="Content in this chapter"}
clang
:::
