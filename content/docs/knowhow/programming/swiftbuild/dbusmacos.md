---
title: Build DBus for Mac OS
---

On Mac OS, the default Qt installation includes QtDBus, but not the DBus
library that it depends on. Pre-built binaries are available in the
externals repository. This howto documents the steps if you want to
build a new version of DBus binaries.

## Building from source


-   Download and extract the
    [libdbus](https://www.freedesktop.org/wiki/Software/dbus/#index5h1)
    source code.
-   Set the deployment target to the lowest supported Mac OS version. At
    the time of writing, this was Mac OS 10.10

```bash
export MACOSX_DEPLOYMENT_TARGET=10.10
```

-   Configure, run and install the build

```bash
./configure --localstatedir=/usr/local/var --sysconfdir=/usr/local/etc --disable-xml-docs --disable-doxygen-docs --enable-launchd --with-launchd-agent-dir=~/Library/LaunchAgents --without-x --disable-tests
make
make install
```

-   `make install` will automatically copy
    `org.freedesktop.dbus-session.plist` into the users LaunchAgents
    directory. So from the next boot up, it will be automatically
    loaded. To load it without rebooting after installation, run:

```bash
load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
```

## Commit to externals

Before committing the new binaries to externals, we need to make some
small adjustments to the library lookup path written in those binaries.

-   Setup `swiftRoot` environmental variable

```bash
export swiftRoot=[path to your swift root]
```

-   First copy them to externals to not change the local installation

```bash
cp /usr/local/bin/dbus-daemon $swiftRoot/externals/macx-clang/bin64/
cp /usr/local/bin/dbus-uuidgen  $swiftRoot/externals/macx-clang/bin64/
cp /usr/local/lib/libdbus-1.3.dylib $swiftRoot/externals/macx-clang/lib64/
```

-   Change the path where dbus executables should look for
    `libdbus-1.3.dylib`:

```bash
cd $swiftRoot/externals/macx-clang/bin64
install_name_tool -change /usr/local/lib/libdbus-1.3.dylib @executable_path/../lib/libdbus-1.3.dylib dbus-daemon
install_name_tool -change /usr/local/lib/libdbus-1.3.dylib @executable_path/../lib/libdbus-1.3.dylib dbus-uuidgen

cd $swiftRoot/externals/macx-clang/lib64
install_name_tool -id @rpath/libdbus-1.3.dylib libdbus-1.3.dylib
```

-   Commit the new binaries
