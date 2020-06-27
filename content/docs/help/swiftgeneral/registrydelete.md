---
title: Delete swift registry values (Windows only)
---

The entries can be deleted from the launcher tool menu (since 0.9.4).

![image](http://img.swift-project.org/clearreg.png)

If you want to do that manually, see
<https://doc.qt.io/qt-5/qsettings.html#locations-where-application-settings-are-stored>

Background: swift saves screen geometry values (windows positions and
sizes) in the registry. If those are corrupt/invalid (new screen, new
screen size) it can cause swift to hang.

------------------------------------------------------------------------

From the above Qt source:
<https://doc.qt.io/qt-5/qsettings.html#locations-where-application-settings-are-stored>

::: {.important}
::: {.title}
Important
:::

`MySoft` and `Star Runner` are example names from the Qt documentation,
would would find `swift-project.org` and the swift application names
instead.
:::

``` {.}
On Unix systems, if the file format is NativeFormat, the following files are used by default:

$HOME/.config/MySoft/Star Runner.conf (Qt for Embedded Linux: $HOME/Settings/MySoft/Star Runner.conf)
$HOME/.config/MySoft.conf (Qt for Embedded Linux: $HOME/Settings/MySoft.conf)
for each directory <dir> in $XDG_CONFIG_DIRS: <dir>/MySoft/Star Runner.conf
for each directory <dir> in $XDG_CONFIG_DIRS: <dir>/MySoft.conf
Note: If XDG_CONFIG_DIRS is unset, the default value of /etc/xdg is used.

On macOS versions 10.2 and 10.3, these files are used by default:

$HOME/Library/Preferences/com.MySoft.Star Runner.plist
$HOME/Library/Preferences/com.MySoft.plist
/Library/Preferences/com.MySoft.Star Runner.plist
/Library/Preferences/com.MySoft.plist
On Windows, NativeFormat settings are stored in the following registry paths:

HKEY_CURRENT_USER\Software\MySoft\Star Runner
HKEY_CURRENT_USER\Software\MySoft\OrganizationDefaults
HKEY_LOCAL_MACHINE\Software\MySoft\Star Runner
HKEY_LOCAL_MACHINE\Software\MySoft\OrganizationDefaults
Note: On Windows, for 32-bit programs running in WOW64 mode, settings are stored in the following registry path: HKEY_LOCAL_MACHINE\Software\WOW6432node.

If the file format is NativeFormat, this is "Settings/MySoft/Star Runner.conf" in the application's home directory.

If the file format is IniFormat, the following files are used on Unix, macOS, and iOS:

$HOME/.config/MySoft/Star Runner.ini (Qt for Embedded Linux: $HOME/Settings/MySoft/Star Runner.ini)
$HOME/.config/MySoft.ini (Qt for Embedded Linux: $HOME/Settings/MySoft.ini)
for each directory <dir> in $XDG_CONFIG_DIRS: <dir>/MySoft/Star Runner.ini
for each directory <dir> in $XDG_CONFIG_DIRS: <dir>/MySoft.ini
Note: If XDG_CONFIG_DIRS is unset, the default value of /etc/xdg is used.

On Windows, the following files are used:

FOLDERID_RoamingAppData\MySoft\Star Runner.ini
FOLDERID_RoamingAppData\MySoft.ini
FOLDERID_ProgramData\MySoft\Star Runner.ini
FOLDERID_ProgramData\MySoft.ini
```
