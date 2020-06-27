---
title: Build DBus for Windows
---

On Windows, the default Qt installation includes QtDBus, but not the
DBus library that it depends on. Here are Windows binaries for DBus,
they should be extracted directly into the Qt installation tree:

-   **Verbose-mode builds** (insecure, for *swift* developers)

    > -   F12375 DBus 1.10.24 for MSVC2017 32-bit
    > -   F12376 DBus 1.10.24 for MSVC2017 64-bit
    > -   F12377 DBus 1.10.24 for MinGW 5.3.0 32-bit

-   **Secure-mode builds** (for deployment to *swift* users)

    > -   F12378 DBus 1.10.24 for MSVC2017 32-bit
    > -   F12379 DBus 1.10.24 for MSVC2017 64-bit
    > -   F12380 DBus 1.10.24 for MinGW 5.3.0 32-bit

Building from source
====================

-   Download and install [CMake](https://cmake.org/).

-   Download and extract the [libexpat](http://expat.sourceforge.net/)
    and
    [libdbus](https://www.freedesktop.org/wiki/Software/dbus/#index5h1)
    source code.

    > -   At the time of writing, both the latest stable release and the
    >     [master]{.title-ref} branch of libexpat fail to build on
    >     Windows, so we fall back to the previous stable version
    >     (2.1.1).
    > -   MinGW binaries of libexpat are already part of the default
    >     MinGW itself.

Visual Studio Command Prompt: .. code-block:

    cmake -G "Visual Studio 15 2017" -DCMAKE_INSTALL_PREFIX=C:\expat-msvc32 C:\expat-sources
    msbuild install.vcxproj /p:Configuration=Release

    cmake -G "Visual Studio 15 2017 Win64" -DCMAKE_INSTALL_PREFIX=C:\expat-msvc64 C:\expat-sources
    msbuild install.vcxproj /p:Configuration=Release

    cmake -G "Visual Studio 15 2017" -DCMAKE_INSTALL_PREFIX=C:\dbus-msvc32
        -DEXPAT_INCLUDE_DIR=C:\expat-msvc32\include
        -DEXPAT_LIBRARY=C:\expat-msvc32\lib\expat.lib C:\dbus-sources\cmake
    msbuild install.vcxproj /p:Configuration=Release

    cmake -G "Visual Studio 15 2017 Win64" -DCMAKE_INSTALL_PREFIX=C:\dbus-msvc64
        -DEXPAT_INCLUDE_DIR=C:\expat-msvc64\include
        -DEXPAT_LIBRARY=C:\expat-msvc64\lib\expat.lib C:\dbus-sources\cmake
    msbuild install.vcxproj /p:Configuration=Release

MinGW Command Prompt:

``` {.}
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=C:\dbus-mingw32 C:\dbus-sources\cmake
mingw32-make install
```

Verbose vs. secure builds
=========================

::: {.warning}
::: {.title}
Warning
:::

The default DBus CMake build includes unit tests, asserts, and verbose
mode, which help with debugging but render the library insecure. To
build secure binaries appropriate for deployment to end-users, use these
[cmake]{.title-ref} arguments:
:::

``` {.}
-DDBUS_BUILD_TESTS=OFF -DDBUS_DISABLE_ASSERT=ON -DDBUS_ENABLE_VERBOSE_MODE=OFF
```

Error messages
==============

Some error messages you see when the `libdbus` libs are missing (also
posted here so you can search by the terms)

``` {.}
Cannot find libdbus-1 in your system to resolve symbol 'dbus_get_local_machine_id'.
Debug Error!

Program: P:\Qt\5.9.2\msvc2015\bin\Qt5Cored.dll
Module: 5.9.2
File: qdbus_symbols.cpp
Line: 142
```
