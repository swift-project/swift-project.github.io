---
title: Build on Windows with Clang
---

::: {.warning}
::: {.title}
Warning
:::

This should be considered experimental and could be broken by future
updates of Qt, MSVC, Clang, or seemingly unrelated changes in our own
code.
:::

**Preparation**

-   Download Clang binaries for Windows

    > -   Advice: do not install in the default directory (Program
    >     Files)
    > -   Ensure the bin subdirectory is added to PATH (recommend doing
    >     this manually)

**Considerations**

Things to be aware of:

-   On Linux, Clang tries to mimic GCC, supporting GNU extensions and
    GNU ABI. On Windows, Clang tries to mimic MSVC, supporting Microsoft
    extensions and Microsoft ABI.

-   You need to have installed Microsoft Visual C++, as Clang uses
    Microsoft\'s implementation of the C++ standard library.

-   The mkspec uses
    \[clang-cl\](<http://clang.llvm.org/docs/UsersManual.html#clang-cl>),
    which is a wrapper around clang.exe that understands MSVC
    commandline arguments like /LD, /W3, etc.

-   The following qmake scope test conditions are true when building
    with Clang on Windows:

    > -   win32
    > -   win32-clang-msvc
    > -   msvc
    > -   clang\_cl
    > -   llvm

-   

    The following C++ macros are defined when building with Clang on Windows:

    :   -   Q\_OS\_WIN
        -   Q\_CC\_MSVC
        -   Q\_CC\_CLANG

**Build with qmake and jom**

Using the appropriate Visual Studio command prompt:

``` {.}
qmake -Wlogic -r -spec win32-clang-msvc path\to\swift.pro
jom
```

**Build with Qt Creator**

::: {.warning}
::: {.title}
Warning
:::

This does not seem to be working at the moment. (2018-12-01, Qt Creator
4.7.2)
:::

Qt Creator should detect your installation of LLVM. If it does not, you
can manually add it under the \"Compilers\" tab. Then create a new kit
by cloning one of the existing \"Qt Desktop MSVC2017\" kits. Adjust the
kit by selecting the appropriate Clang compiler from the drop-down list,
and entering the Qt mkspec win32-clang-msvc. Finally, add the kit to
your swift project in the Projects page, make it the active kit, and
start a build.

![image](http://img.swift-project.org/qtc6.png)

**Clang and MinGW**

::: {.warning}
::: {.title}
Warning
:::

This is even more experimental than anything above!
:::

It is also possible to build using Clang on MinGW by using the mkspec
win32-clang-g++.

-   The following qmake scope test conditions will be true:

    > -   win32
    > -   win32-clang-g++
    > -   gcc
    > -   mingw
    > -   llvm

-   The following C++ macros will be defined:

    > -   Q\_OS\_WIN
    > -   Q\_CC\_GCC
    > -   Q\_CC\_CLANG
